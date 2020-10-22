module Scribd
  module Cart
    
    class CartRepo
      class Error < StandardError; end

      class CartsModel < Sequel::Model(:carts)
        self.plugin :timestamps, update_on_create: true
      end

      class ItemsModel < Sequel::Model(:items)
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

      def add_item(user_id, item)
        record = CartsModel.where(user_id: user_id).first
        raise Error.new("User dont have any cart, please create cart first") unless record.present?
        
        item_record = ItemsModel.find(cart_id: record.id, product_id: item.product_id)

        if item_record.present?
          ItemsModel.where(id: item_record.id).update(quantity: item_record.quantity + item_record.quantity)
        else
          ItemsModel.create(
            cart_id: item.cart_id,
            id: item.id,
            product_id: item.product_id,
            quantity: item.quantity
          )
        end

        find_by_user_id(user_id)
      
      end

    end
  end
end