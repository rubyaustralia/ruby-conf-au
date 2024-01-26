require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2024
    module App
      def self.registered(app)
        app.register Sinatra::Namespace

        app.namespace '/2024' do
          get do
            puts "hello"
            redirect 'https://2024.rubyconf.au/'
          end
        end
      end
    end
  end

  Sinatra.register Year2024::App
end
