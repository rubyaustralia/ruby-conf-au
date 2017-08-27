require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2018
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2018' do
          get '/?' do
            @page = :home
            @title = :home
            haml :"2018/home", :layout => :"2018/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name]
            @page = page_name
            @title = page_name
            haml :"2018/#{page_name}", :layout => :"2018/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2018::App
end
