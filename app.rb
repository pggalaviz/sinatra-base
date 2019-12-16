require 'sinatra/base'
require 'rack/protection'
require 'rack/csrf'

class App < Sinatra::Base
  use Rack::Session::Cookie, secret: ENV['SESSION_SECRET'] ||= "superSecret"

  use Rack::Protection
  use Rack::Protection::RemoteReferrer
  # Don't use CRSF for Json requests.
  use Rack::Csrf, skip_if: ->(request) {
    request.env["CONTENT_TYPE"] == "application/json"
  }

  get '/' do
    erb :index
  end

  not_found do
    erb :ups
  end
end
