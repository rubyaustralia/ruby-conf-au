require "bundler"
Bundler.require(:default)

# before { request.path_info.sub! %r{/$}, '' }

configure do
  set :haml, :format => :html5

  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end

  set :scss, Compass.sass_engine_options
end

get '/' do
  @title = :home
  haml :"2014/home", :layout => :"2014/layout"
end

get ':page_name' do
  page_name = params[:page_name]
  @title = page_name
  haml :"2014/#{page_name}", :layout => :"2014/layout"
end

# Handling last year's conf website
get '/2013/?' do
  @title = :home
  haml :"2013/home", :layout => :"2013/layout"
end

get '/2013/:page_name' do
  page_name = params[:page_name]
  @title = page_name
  haml :"2013/#{page_name}", :layout => :"2013/layout"
end

post '/subscribe' do
  content_type :json

  CreateSend.api_key '64e1e3a9ca79765e3a439a2fd4588dc8'
  begin
    CreateSend::Subscriber.add "da0ee77746e2f89b40a3bdff230c415d", params[:email], "", [], true
    rescue CreateSend::BadRequest => br
      puts "Bad request error: #{br}"
      puts "Error Code:    #{br.data.Code}"
      puts "Error Message: #{br.data.Message}"
    rescue Exception => e
      puts "Error: #{e}"
  end

  {success: true}.to_json
end

get "/:year/stylesheets/main.css" do
  content_type 'text/css', :charset => 'utf-8'
  scss :"#{params[:year]}/styles/main"
end
