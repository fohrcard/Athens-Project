require 'rails_helper'

RSpec.describe Post, type: :model do
  it "belongs to a user" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    expect(post.user.id).to eq(user.id)
  end
  it "has many votes" do
    user = create(:user)
    user_two = create(:user)
    post = create(:post, user_id: user.id)
    user.votes.create(post_id: post.id, image_one: true)
    user_two.votes.create(post_id: post.id, image_one: true)
    expect(post.votes.size).to eq(2)
  end
end
