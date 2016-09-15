require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success and user" do
      get :index, {format: :json}
      expect(response).to have_http_status(:success)
      expect(json_response["id"].present?).to eq(true)
    end

    it "returns a list of posts to vote on" do
      user = create(:user)
      3.times do
        create(:post, user_id: create(:user).id)
      end

      get :requests, {format: :json}
      expect(response).to have_http_status(:success)
      expect(json_response.size).to eq(3)
    end
  end

end
