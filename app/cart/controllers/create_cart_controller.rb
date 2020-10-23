module Scribd
  module Cart
    
    class CreateCartController
      def initialize(user_id:)
        @user_id = user_id
      end

      def run!
        cart = Cart.new(user_id: @user_id)
        repo = CartRepo.new

        cart = repo.save(cart)

       cart.to_hash
      end
    end

  end
end