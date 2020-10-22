module Scribd
  module Cart
    
    class CartRepo
      class Error < StandardError; end

      class CartsModel < Sequel::Model(:carts)
        self.plugin :timestamps, update_on_create: true
      end

      def create(cart)

        cart_from_db = CartsModel.where(user_id: cart.user_id).first

        raise Error.new("User already has a cart") if cart_from_db.present?


        record = CartsModel.create(
          id: cart.id,
          user_id: cart.user_id
        )

        cart.set_timestamps(
          created_at: record.created_at, 
          updated_at: record.updated_at
        )

        cart
      end

    end
  end
end