require_relative "./spec_helper.rb"

describe "remove to Shopping cart" do
  let(:user_id) { 123 }
  let(:create_cart_controller) { Scribd::Cart::CreateCartController.new(user_id: user_id) }
  let(:get_cart_controller) { Scribd::Cart::GetCartController.new(user_id: user_id) }


  before(:each) do
    create_cart_controller.run!
  end

  it "should remove item to cart" do
      
    add_item_controller = Scribd::Cart::RemoveItemController.new(
      user_id: 123,
      product_id: 123
    ).run!

    expect(get_cart_controller.run!).to include(
      user_id: 123, 
      items: []
    )
  
  end
end