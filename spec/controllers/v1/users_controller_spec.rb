require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success and user" do
      get :index, {format: :json}
      expect(response).to have_http_status(:success)
      expect(json_response["id"].present?).to eq(true)
    end
  end

end
