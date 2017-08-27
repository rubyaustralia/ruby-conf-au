require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2015
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2015' do
          get '/?' do
            @title = :home
            @speaker = %w( keithpitty.jpg laurenvoswinkel.jpg philiparndt.jpg konstantingredeskoul.png johndalton.jpg shevauncoker.jpg seanmarcia.jpg josspaling.jpg erikmichaelsober.jpg johnbarton.jpg amywibowo.jpg
              scottfeinberg.jpg sabrinaleandro.jpg ).sample
            haml :"2015/home", :layout => :"2015/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name]
            @title = page_name
            haml :"2015/#{page_name}", :layout => :"2015/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2015::App
end
