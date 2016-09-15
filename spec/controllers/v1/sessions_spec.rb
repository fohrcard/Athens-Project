require 'rails_helper'

RSpec.describe V1::SessionsController, :type => :controller do
  describe "GET #create" do
    it "responds successfully with an HTTP 201 status code" do
      user = create(:user, password: "secret123", password_confirmation: "secret123")
      post :create, {format: :json, params: {email: user.email, password: "secret123"}}
      expect(response).to have_http_status(200)
      expect(json_response["auth_token"].present?).to eq(true)
      expect(json_response["user"]["id"]).to eq(user.id)
    end
    it "response with an error if no email or password is present" do
      get :create, { :format => :json }
      expect(response).to have_http_status(401)
    end
  end
end
