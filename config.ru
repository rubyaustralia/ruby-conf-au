Bundler.require(:default)

require './app'

use Rack::SslEnforcer if ENV["RACK_ENV"] == "production"
run RubyConf::App
