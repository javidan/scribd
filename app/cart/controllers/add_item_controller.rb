module Scribd
  module Cart
    
    class AddItemController
      def initialize(user_id:, product_id:, quantity: 1)
        @user_id = user_id
        @product_id= product_id
        @quantity = quantity
      end

      def run!
        
        repo = CartRepo.new
        cart = repo.find_by_user_id(@user_id)
        
        cart.add_item(product_id: @product_id, quantity: @quantity)
        
        repo.add_item(@user_id, cart.items.last)

        cart.to_hash
      end
    end

  end
end