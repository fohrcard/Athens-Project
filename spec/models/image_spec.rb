require 'rails_helper'

RSpec.describe Image, type: :model do
  it "belongs to a post" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    image = create(:image, post_id: post.id)
    expect(image.post.id).to eq(post.id)
  end
  it "has many votes" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    image = create(:image, post_id: post.id)
    create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    expect(image.votes.size).to eq(2)
  end
  it "totals votes" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    image = create(:image, post_id: post.id)
    create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    create(:vote, image_id: image.id, user_id: user.id, post_id: post.id)
    expect(image.total_votes).to eq(2)
  end
end
