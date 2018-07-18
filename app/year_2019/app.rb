require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2019
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2019' do
          get '/?' do
            @title = :home

            haml :"2019/home", :layout => :"2019/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name]
            @title = page_name
            haml :"2019/#{page_name}", :layout => :"2019/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2019::App
end
