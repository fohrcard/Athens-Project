require 'rails_helper'

RSpec.describe Image, type: :model do
  it "belongs to a user" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    image = create(:image, user_id: user.id, post_id: post.id)
    expect(image.user.id).to eq(user.id)
  end
  it "belongs to a post" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    image = create(:image, user_id: user.id, post_id: post.id)
    expect(image.post.id).to eq(post.id)
  end
end
