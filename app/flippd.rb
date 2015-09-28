require 'dotenv'
Dotenv.load

require 'sinatra'
require 'sinatra/multi_route'
require 'rack-flash'

class Flippd < Sinatra::Application
  register Sinatra::MultiRoute
  use Rack::Session::Cookie, secret: ENV['COOKIE_SECRET']
  use Rack::Flash

  before do
    @version = "0.0.2"
  end
end

require_relative 'routes/init'
