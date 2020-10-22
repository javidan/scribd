require_relative "./spec_helper.rb"


describe "Create Shopping cart" do

  it "should create shopping cart" do
    
    controller = Scribd::Cart::CreateCartController.new(user_id: 123)

    expect(controller.run!).to include(:user_id => 123)
  
  end

end