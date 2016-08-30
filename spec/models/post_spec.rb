require 'rails_helper'

RSpec.describe Post, type: :model do
  it "belongs to a user" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    expect(post.user.id).to eq(user.id)
  end

  it "has many images" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    create(:image, user_id: user.id, post_id: post.id)
    create(:image, user_id: user.id, post_id: post.id)
    expect(post.images.size).to eq(2)
  end
end
