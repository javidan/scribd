module Scribd
  module Cart
    
    class RemoveItemController
      def initialize(user_id:, product_id:)
        @user_id = user_id
        @product_id= product_id
      end

      def run!
        
        repo = CartRepo.new
        cart = repo.find_by_user_id(@user_id)

        cart.remove_item(@product_id)
        
        repo.save(cart)

        cart.to_hash
      end
    end

  end
end