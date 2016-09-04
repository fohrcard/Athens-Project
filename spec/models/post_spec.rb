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

  it "shows the votes breakdown" do
    user = create(:user)
    post = create(:post, user_id: user.id)

    Vote.create(user_id: create(:user).id, post_id: post.id, image_one: true)
    Vote.create(user_id: create(:user).id, post_id: post.id, image_one: true)
    Vote.create(user_id: create(:user).id, post_id: post.id, image_one: false)


    expect(post.total_votes).to eq(3)
    expect(post.image_one_total_votes).to eq(2)
    expect(post.image_two_total_votes).to eq(1)
  end
end
