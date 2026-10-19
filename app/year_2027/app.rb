require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2027
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2027' do
          get do
            erb :"2027/placeholder"
          end
        end
      end
    end
  end

  Sinatra.register Year2024::App
end
