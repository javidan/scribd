module Scribd
  module Cart
    
    class CartRepo

      class CartsModel < Sequel::Model(:carts)
        self.plugin :timestamps, update_on_create: true
        self.plugin :update_or_create
      end

      class ItemsModel < Sequel::Model(:items)
        self.plugin :timestamps, update_on_create: true
        self.plugin :timestamps, update_on_create: true
      end

      def save(cart)

        record = CartsModel.find(user_id: cart.user_id)

        if record.blank?
          record = CartsModel.create(
            id: cart.id, 
            user_id: cart.user_id
          )
        else
          cart.id = record.id
        end

        ItemsModel.where(cart_id: record.id).delete

        cart.items.each do |item|
          ItemsModel.create(
            cart_id: item.cart_id,
            id: item.id,
            product_id: item.product_id,
            quantity: item.quantity
          )
        end

        cart.set_timestamps(created_at: record.created_at, updated_at: record.updated_at)
        cart
      end


      def find_by_user_id(user_id)
        record = CartsModel.where(user_id: user_id).first
        raise Error.new("User dont have any cart") unless record.present?

        cart = Cart.new(
          id: record.id,
          user_id: record.user_id,
        )
        cart.set_timestamps(created_at: record.created_at, updated_at: record.updated_at)

        
        item_records = ItemsModel.where(cart_id: cart.id)

        item_records.each do |record|
          cart.add_item(
            product_id: record.product_id,
            quantity: record.quantity
          )
        end

        cart
      end

    end
  end
end