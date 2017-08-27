require 'sinatra/base'
require 'sinatra/namespace'
require_relative 'speaker'
require_relative 'speaker_list'

module RubyConf
  module Year2017
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2017' do
          get '/?' do
            @title = :home
            @speakers = TwentySeventeen::SpeakerList.load(File.join('assets', '2017', 'data', 'speakers.yml'))
            haml :"2017/home", :layout => :"2017/layout"
          end

          get '/:page_name' do
            @speakers = TwentySeventeen::SpeakerList.load(File.join('assets', '2017', 'data', 'speakers.yml'))
            page_name = params[:page_name]
            @title = page_name
            haml :"2017/#{page_name}", :layout => :"2017/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2017::App
end
