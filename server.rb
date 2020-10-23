Bundler.require(:default, ENV['RACK_ENV'])


config = YAML.load_file("./config/#{ENV['RACK_ENV'] || "development"}.yaml")

DB = Sequel.connect(config["db"]["connection_string"])

require 'grape-swagger'
require_relative 'app/cart/include.rb'
require_relative 'routes/cart.rb'

module SwaggerRouting
  private
  alias_method :combine_routes_original, :combine_routes

  def combine_routes(app, doc_klass)
    combine_routes_original(app, doc_klass)
    @target_class.combined_routes["carts"].reverse!
  end

end

module Scribd
  class Server < Grape::API
    mount Scribd::Cart::Routes 
    add_swagger_documentation mount_path: '/api/docs', info: {
      title: 'Cart Microservice API', 
      description: "Manipulation API for a Cart"
    }
  end
end 