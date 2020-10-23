module Scribd
  module Cart
    class Routes < Grape::API
      format :json
  
      namespace 'carts' do

        ## Get cart Info
        desc "It will get Cart information"
        params do
          requires :user_id, type: Integer, desc: "Id of user"
        end

        get '/:user_id' do
          begin
            controller = Scribd::Cart::GetCartController.new(user_id: params[:user_id])
            controller.run!
          rescue Scribd::Cart::Error => e
            status 400
            {
              status: :error,
              message: e.message
            }
          end
        end
        ## END

        ## Create cart
        desc "It will create Cart"
        params do
          requires :user_id, type: Integer, desc: "Id of user"
        end

        post '/:user_id' do
          begin
            controller = Scribd::Cart::CreateCartController.new(user_id: params[:user_id])
            controller.run!
          rescue Scribd::Cart::Error => e
            status 400
            {
              status: :error,
              message: e.message
            }
          end
        end
        ## END

        ## Add item to cart
        desc "It will add item to Cart"
        params do
         
          requires :user_id, type: Integer, desc: "Id of user"
          requires :product, type: Hash, documentation: { param_type: 'body' } do
            requires :quantity, type: Integer, desc: "Quantity of user"
            requires :product_id, type: Integer, desc: "Id of product"
          end
        end

        post '/:user_id/items' do
          begin
            Scribd::Cart::AddItemController.new(
              user_id:  params[:user_id],
              product_id:  params[:product][:product_id],
              quantity:  params[:product][:quantity]
            ).run!
            
          rescue Scribd::Cart::Error => e
            status 400
            {
              status: :error,
              message: e.message
            }
          end
        end
        ## END

        ## Remove item from cart
        desc "It will remove item from Cart"
        params do
          requires :product_id, type: Integer, desc: "Id of product"
          requires :user_id, type: Integer, desc: "Id of user"
        end

        delete '/:user_id/items/:product_id' do
          begin
            Scribd::Cart::RemoveItemController.new(
              user_id:  params[:user_id],
              product_id:  params[:product_id],
            ).run!
            
          rescue Scribd::Cart::Error => e
            status 400
            {
              status: :error,
              message: e.message
            }
          end
        end
        ## END

        ## Empty cart
        desc "It will empty the Cart"
        params do
          requires :user_id, type: Integer
        end

        post '/:user_id/clean' do
          begin
            Scribd::Cart::EmptyCartController.new(
              user_id:  params[:user_id]
            ).run!
            
          rescue Scribd::Cart::Error => e
            status 400
            {
              status: :error,
              message: e.message
            }
          end
        end
        ## END

      end
    end
  end
end