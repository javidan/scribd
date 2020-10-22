require_relative "./spec_helper.rb"


describe "Create Shopping cart" do

  it "should create shopping cart" do
    
    create_controller = Scribd::Cart::CreateCartController.new(user_id: 123)

    expect(create_controller.run!).to include(:user_id => 123)
  
  end


  it "should get shopping cart" do
    
    create_controller = Scribd::Cart::CreateCartController.new(user_id: 123)

    create_controller.run!

    get_controller = Scribd::Cart::GetCartController.new(user_id: 123)
    expect(get_controller.run!).to include(:user_id => 123)
  
  end

end