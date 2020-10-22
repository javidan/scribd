module Scribd
  module Cart
    class Item
      attr_reader :id, :product_id, :quantity, :cart_id

      def initialize(product_id:, quantity:, cart_id:, id: nil)
        @product_id = product_id
        @id = id || SecureRandom.uuid
        @quantity = quantity
        @cart_id = cart_id
      end

      def to_hash
        {
          product_id: product_id,
          quantity: quantity
        }
      end

    end
  end
end