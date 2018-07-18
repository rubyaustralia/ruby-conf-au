Bundler.require(:default)
require 'active_support/core_ext/hash/indifferent_access'
require_relative 'app/year_2013/app'
require_relative 'app/year_2014/app'
require_relative 'app/year_2015/app'
require_relative 'app/year_2016/app'
require_relative 'app/year_2017/app'
require_relative 'app/year_2018/app'
require_relative 'app/year_2019/app'

module RubyConf
  class App < Sinatra::Application
    configure do
      set :haml, :format => :html5
      set :views, File.join(Dir.pwd, 'views')
      set :root, File.join(Dir.pwd)
      set :public_folder, File.join(Dir.pwd, 'public')
      set :force_ssl, true

      Compass.configuration do |config|
        config.project_path = File.dirname(__FILE__)
        config.sass_dir = 'views'
      end

      set :scss, Compass.sass_engine_options
    end

    configure :production do
      set :host, 'rubyconf.org.au'
      set :force_ssl, true
    end

    configure :development do
      require 'sinatra/reloader'

      set :host, 'rubyconf.dev'
      set :force_ssl, true
    end

    helpers do
      def file_digest(file)
        File.read("#{file}.md5")
      end

      def asset_path(file)
        "/#{file}?#{file_digest('public/' + file)}"
      end
    end

    # Haml file-not-found exception bubbling up from the depths.
    error Errno::ENOENT do
      halt(404)
    end

    before do
      if !request.secure?
        secure_url = "https://#{settings.host}#{request.fullpath}"
        request.logger.info "Insecure request, redirecting to #{secure_url}"
        redirect secure_url
      end
    end

    register Year2013::App
    register Year2014::App
    register Year2015::App
    register Year2016::App
    register Year2017::App
    register Year2018::App
    register Year2019::App

    get '/' do
      status_code 302
      redirect "/#{years.last}"
    end

    post '/subscribe' do
      content_type :json

      CreateSend.api_key '64e1e3a9ca79765e3a439a2fd4588dc8'
      begin
        CreateSend::Subscriber.add "da0ee77746e2f89b40a3bdff230c415d", params[:email], "", [], true
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

RubyConf::App.run!
