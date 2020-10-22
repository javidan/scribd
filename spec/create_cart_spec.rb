require_relative "./spec_helper.rb"


describe "Create Shopping cart" do
  let(:user_id) { 123 }
  let(:create_cart_controller) { Scribd::Cart::CreateCartController.new(user_id: user_id) }
  let(:get_cart_controller) { Scribd::Cart::GetCartController.new(user_id: user_id) }


  it "should create shopping cart" do
    expect(create_cart_controller.run!).to include(user_id: user_id)
  
  end

  it "should get shopping cart" do
    create_cart_controller.run!
    expect(get_cart_controller.run!).to include(user_id: user_id)
  end
end