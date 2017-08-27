require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2014
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2014' do
          get '/?' do
            page_name = params[:page_name]
            @title = page_name
            haml :"2014/home", :layout => :"2014/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name]
            @title = page_name
            haml :"2014/#{page_name}", :layout => :"2014/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2014::App
end
