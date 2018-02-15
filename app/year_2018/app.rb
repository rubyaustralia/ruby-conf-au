require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2018
    class Speaker
      def initialize(data)
        @data = data
      end

      def first_name
        data['name'].split(' ').first
      end

      def last_name
        data['name'].split(' ').last
      end

      def avatar_filename(format: 'png')
        "/2018/images/speakers/#{first_name.downcase}-#{last_name.downcase}.#{format}"
      end

      def bio
        data['bio']
      end

      def pitch
        data['pitch']
      end

      def has_twitter?
        !twitter.nil? && twitter.length > 0
      end

      def twitter
        data["twitter"] && data["twitter"].strip
      end

      def is_keynote?
        data["pitch"].strip.downcase == 'keynote' || data["pitch"].nil?
      end

      private
      attr_reader :data
    end

    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2018' do
          get '/?' do
            @page = :home
            @title = :home
            random_speaker = YAML.load_file(File.join('app', 'year_2018', 'data', 'speakers.yml'))[1..-1].shuffle.first
            @speaker = Speaker.new(random_speaker)
            haml :"2018/home", :layout => :"2018/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name].underscore
            @page = page_name
            @title = page_name
            @speakers = YAML.load_file(File.join('app', 'year_2018', 'data', 'speakers.yml')).map{ |d| Speaker.new(d) }
            haml :"2018/#{page_name}", :layout => :"2018/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2018::App
end
