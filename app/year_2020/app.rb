require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2020
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2020' do
            get '/?' do
                @title = :home
                haml :"2020/home", :layout => :"2020/layout"
            end

            get '/schedule' do
                @title = 'Schedule'
            end

            get '/:page_name' do
                page_name = params[:page_name]
                @title = page_name
                haml :"2020/#{page_name}", :layout => :"2020/layout"
            end
        end
      end
    end
  end

  Sinatra.register Year2020::App
end
