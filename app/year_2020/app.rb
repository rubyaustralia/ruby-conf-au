require 'sinatra/base'

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
        end
      end
    end
  end

  Sinatra.register Year2020::App
end
