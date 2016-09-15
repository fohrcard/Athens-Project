require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, {format: :json}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, {format: :json, params: {image_one: Faker::Avatar.image("image_one"), image_two: Faker::Avatar.image("image_two")}}
      expect(response).to have_http_status(:created)
    end
    it "returns http error" do
      post :create, {format: :json, params: {image_one: Faker::Avatar.image("image_one"), image_two: nil}}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json_response["error_message"].present?).to eq(true)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      post = create(:post, user_id: create(:user).id)
      get :destroy, {format: :json, params: {id: post.id}}
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post #flag" do
    it "returns http success" do
      user = create(:user)
      post_obj = create(:post, user_id: user.id)
      post :flag, {format: :json, params: {post_id: post_obj.id}}
      expect(response).to have_http_status(:success)
      expect(post_obj.user.flag).to eq(1)
    end
  end

end
