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
    create(:image, post_id: post.id)
    create(:image, post_id: post.id)
    expect(post.images.size).to eq(2)
  end

  it "increases count of total votes for post on create" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    image = create(:image, post_id: post.id)
    create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    expect(post.total_votes).to eq(2)
  end
  it "decreases count of total votes for post on destroy" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    image = create(:image, post_id: post.id)
    vote1 = create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    vote2 = create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    vote2.destroy
    expect(post.total_votes).to eq(1)
  end
end
