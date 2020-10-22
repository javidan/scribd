Bundler.require(:default, ENV['RACK_ENV'])


config = YAML.load_file("./config/#{ENV['RACK_ENV'] || "development"}.yaml")

DB = Sequel.connect(config["db"]["connection_string"])

require_relative 'routes/cart.rb'


module Scribd
  class Server < Grape::API
    mount Scribd::Cart::Routes 
  end
end 