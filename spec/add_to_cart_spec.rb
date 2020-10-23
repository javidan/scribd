require_relative "./spec_helper.rb"

describe "Add to Shopping cart" do
  let(:user_id) { 123 }
  let(:create_cart_controller) { Scribd::Cart::CreateCartController.new(user_id: user_id) }
  let(:get_cart_controller) { Scribd::Cart::GetCartController.new(user_id: user_id) }


  before(:each) do
    create_cart_controller.run!
  end

  it "should add item to cart" do
      
    add_item_controller = Scribd::Cart::AddItemController.new(
      user_id: 123,
      product_id: 123,
      quantity: 3
    ).run!

    expect(get_cart_controller.run!).to include(
      user_id: 123, 
      items: [{
        product_id: 123,
        quantity: 3
      }]
    )
  
  end

  it "should update quantity if 2 times same item added" do
    
    Scribd::Cart::AddItemController.new(
      user_id: 123,
      product_id: 123,
      quantity: 3
    ).run!

    Scribd::Cart::AddItemController.new(
      user_id: 123,
      product_id: 123,
      quantity: 3
    ).run!
    

    expect(get_cart_controller.run!).to include(
      user_id: 123, 
      items: [{
        product_id: 123,
        quantity: 6
      }])
  
  end

  it "should show 2 items if 2 items added" do
    
    Scribd::Cart::AddItemController.new(
      user_id: 123,
      product_id: 123,
      quantity: 3
    ).run!

    Scribd::Cart::AddItemController.new(
      user_id: 123,
      product_id: 125,
      quantity: 3
    ).run!
    

    expect(get_cart_controller.run!).to include(
      user_id: 123, 
      items: [{
        product_id: 123,
        quantity: 3
      },
      {
        product_id: 125,
        quantity: 3
      }])
  
  end

end