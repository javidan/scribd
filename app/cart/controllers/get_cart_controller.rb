module Scribd
  module Cart
    
    class GetCartController
      def initialize(user_id:)
        @user_id = user_id
      end

      def run!
        
        repo = CartRepo.new
        cart = repo.find_by_user_id(@user_id)
        
        cart.to_hash
      end
    end

  end
end