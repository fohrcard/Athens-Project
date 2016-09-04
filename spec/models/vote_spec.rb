require 'rails_helper'

RSpec.describe Vote, type: :model do
  it "belongs to a user" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    vote = create(:vote, user_id: user.id, post_id: post.id)
    expect(vote.user.id).to eq(user.id)
  end
  it "belongs to a post" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    vote = create(:vote, user_id: user.id, post_id: post.id, image_one: false)
    expect(vote.post.id).to eq(post.id)
  end
end
