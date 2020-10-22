module Scribd
  module Cart
    class Item
      attr_reader :id, :product_id, :card_id, :quantity

      def initialize(id:, product_id:, card_id:, quantity:)
        @product_id = product_id
        @id = id
        @card_id = card_id
        @quantity = quantity
      end

    end
  end
end