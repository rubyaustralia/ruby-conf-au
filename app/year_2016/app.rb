require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2016
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2016' do
          get '/?' do
            @title = :home
            @speaker = %w(katrina-owen.jpg senator-scott-ludlam.jpg).sample
            haml :"2016/home", :layout => :"2016/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name]
            @title = page_name
            haml :"2016/#{page_name}", :layout => :"2016/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2016::App
end
