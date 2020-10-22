

module Scribd
  module Cart
    class Cart
      attr_reader :id, :user_id, :items, :created_at, :updated_at

      def initialize(user_id:, id: nil)
        @user_id = user_id
        @id = id || SecureRandom.uuid
        @items = []
        @created_at = nil
        @updated_at = nil
      end

      def add_item(product_id:, quantity:, item_id: nil)
        @items << Item.new(id: item_id, cart_id: id, product_id: product_id, quantity: quantity)
      end

      def set_timestamps(created_at:, updated_at:)
        @created_at = created_at
        @updated_at = updated_at
      end

      def to_hash
        {
          id: id,
          user_id: user_id,
          items: items.map(&:to_hash),
          created_at: created_at,
          updated_at: updated_at
        }
      end

    end
  end
end