# frozen_string_literal: true

require 'active_support/inflector'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/string/output_safety'

require_relative 'app/year_2013/app'
require_relative 'app/year_2014/app'
require_relative 'app/year_2015/app'
require_relative 'app/year_2016/app'
require_relative 'app/year_2017/app'
require_relative 'app/year_2018/app'
require_relative 'app/year_2019/app'
require_relative 'app/year_2020/app'
require_relative 'app/year_2023/app'

module RubyConf
  class App < Sinatra::Application
    configure do
      set :haml, :format => :html5
      set :views, File.join(Dir.pwd, 'views')
      set :root, File.join(Dir.pwd)
      set :public_folder, File.join(Dir.pwd, 'public')
      set :force_ssl, true
    end

    configure :development do
      require 'sinatra/reloader'
    end

    helpers do
      def asset_path(file)
        @manifest ||= JSON.parse(File.read("public/assets/manifest.json"))
        @manifest[file]
      end
    end

    # Haml file-not-found exception bubbling up from the depths.
    error Errno::ENOENT do
      halt(404)
    end

    register Year2013::App
    register Year2014::App
    register Year2015::App
    register Year2016::App
    register Year2017::App
    register Year2018::App
    register Year2019::App
    register Year2020::App
    register Year2023::App

    get '/' do
      status_code 302
      redirect "/#{years.last}"
    end

    post '/subscribe' do
      content_type :json

      begin
        CreateSend::Subscriber.add(
          {:api_key => ENV["CAMPAIGN_MONITOR_API_KEY"]},
          ENV["CAMPAIGN_MONITOR_LIST_ID"],
          params[:email],
          "",
          nil,        # custom fields
          true,       # resubscribe
          'Unchanged' # consent_to_track
        )
      rescue CreateSend::BadRequest => br
        puts "Bad request error: #{br}"
        puts "Error Code:    #{br.data.Code}"
        puts "Error Message: #{br.data.Message}"
      rescue Exception => e
        puts "Error: #{e}"
      end

      {success: true}.to_json
    end

    get "/:year/stylesheets/main.css" do
      content_type 'text/css', :charset => 'utf-8'
      scss :"#{params[:year]}/styles/main"
    end

    private
    def current_year
      years.last
    end

    def years
      @years ||= configs.map{ |f| f.match(/\d{4}/)[0] }.sort
    end

    def configs
      Dir.glob(File.join(self.settings.root, "app", "year_????", "app.rb"))
    end

    def self.file_root
      Dir.pwd
    end
  end
end
