describe GestureController do
  tests GestureController

  it "view exists" do
    view("view 1").should.not.be.nil
  end

  it "tap" do
    tap 'view 1'
    controller.instance_variable_get("@alert_box").message.should == "You've tapped the screen!"
  end
end
