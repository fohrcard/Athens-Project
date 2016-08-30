require 'rails_helper'

RSpec.describe Post, type: :model do
  it "belongs to a user" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    expect(post.user.id).to eq(user.id)
  end
end
