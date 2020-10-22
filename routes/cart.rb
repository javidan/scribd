module Skribd
  module Cart
    class Routes < Grape::API
      format :json
  
      namespace 'carts' do

        desc "get Articles"
        get '/' do
         {
           hello: "world"
         }
        end
      end
    end
  end
end