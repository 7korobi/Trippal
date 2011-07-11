require './spec/spec_helper'

describe SessionsController do
  it "should logout if destroy" do
    post 'destroy'
    controller.send(:current).auth.should be_nil
    controller.send(:current).user.should be_nil
    response.should redirect_to '/'
  end
end

