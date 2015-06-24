# sessions_controller_spec.rb
require 'spec_helper'
 
RSpec.describe SessionsController do
 
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
  end
 
  describe "#create" do
 
    it "should successfully create a user" do
      expect {
        post :create, provider: :linkedin
      }.to change{ User.count }.by(1)
    end
 
    it "should successfully create a session" do
       expect(session[:user_id]).to be_nil
      post :create, provider: :linkedin
      expect(session[:user_id]).not_to be_nil
    end
 
    it "should redirect the user to the User choice url" do
      post :create, provider: :linkedin
      expect(response).to redirect_to edit_user_url(session[:user_id])
    end
 
  end
 
  describe "#destroy" do
    before do
      post :create, provider: :linkedin
    end
 
    it "should clear the session" do
      session[:user_id].should_not be_nil
      delete :destroy
      session[:user_id].should be_nil
    end
 
    it "should redirect to the home page" do
      delete :destroy
      response.should redirect_to root_url
    end
  end
 
end