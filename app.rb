require "bundler"
Bundler.require(:default)

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
  haml :home
end

get '/speakers' do
  @title = :speakers
  haml :speakers
end

get '/sessions' do
  @title = :sessions
  haml :sessions
end

get '/workshops' do
  @title = :workshops
  haml :workshops
end

get '/sponsors' do
  @title = :sponsors
  haml :sponsors
end

get '/news' do
  @title = :news
  haml :news
end

get '/policies' do
  @title = :policies
  haml :policies
end

get '/venue' do
  @title = :venue
  haml :venue
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

get "/stylesheets/main.css" do
  content_type 'text/css', :charset => 'utf-8'
  scss :"styles/main"
end