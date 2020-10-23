Bundler.require(:default, ENV['RACK_ENV'])


config = YAML.load_file("./config/#{ENV['RACK_ENV'] || "development"}.yaml")

DB = Sequel.connect(config["db"]["connection_string"])

require 'grape-swagger'
require_relative 'routes/cart.rb'
require_relative 'app/cart/include.rb'


module Scribd
  class Server < Grape::API
    mount Scribd::Cart::Routes 
    add_swagger_documentation mount_path: '/api/docs', info: {
      title: 'Cart Microservice API', 
      description: "Manipulation API for a Cart"
    }
  end
end 