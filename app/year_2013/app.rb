require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2013
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2013' do
          get '/?' do
            @title = :home
            haml :"2013/home", :layout => :"2013/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name]
            @title = page_name
            haml :"2013/#{page_name}", :layout => :"2013/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2013::App
end
