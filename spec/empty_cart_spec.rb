require_relative "./spec_helper.rb"

describe "Empty to Shopping cart" do
  let(:user_id) { 123 }
  let(:create_cart_controller) { Scribd::Cart::CreateCartController.new(user_id: user_id) }
  let(:get_cart_controller) { Scribd::Cart::GetCartController.new(user_id: user_id) }
  let(:empty_cart_controller) { Scribd::Cart::EmptyCartController.new(user_id: user_id) }


  before(:each) do
    create_cart_controller.run!
  end

  it "should remove item to cart" do
    Scribd::Cart::AddItemController.new(
      user_id: user_id,
      product_id: 123,
      quantity: 3
    ).run!

    Scribd::Cart::AddItemController.new(
      user_id: user_id,
      product_id: 123,
      quantity: 3
    ).run!

    Scribd::Cart::AddItemController.new(
      user_id: user_id,
      product_id: 126,
      quantity: 2
    ).run!

    empty_cart_controller.run!
    
    expect(get_cart_controller.run!).to include(
      user_id: 123, 
      items: []
    )
  
  end
end