require 'grape'

require_relative 'server.rb'

require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete]
  end
end


run Skribd::Server