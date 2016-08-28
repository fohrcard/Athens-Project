require 'rails_helper'

RSpec.describe V1::RegistrationsController, :type => :controller do
  describe "GET #create" do
    it "responds successfully with an HTTP 201 status code" do
      post :create, {format: :json, params: attributes_for(:user)}
      expect(response).to have_http_status(201)
      expect(response).to have_http_status(201)
      expect(json["auth_token"].present?).to eq(true)
      expect(json["user"].present?).to eq(true)
    end
    it "response with an error if no email or password is present" do
      get :create, { :format => :json }
      expect(response).to have_http_status(422)
    end
  end
end
