require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires an email" do
    expect(FactoryGirl.build(:user, email: nil).valid?).to eq(false)
  end
  it "requires a password" do
    expect(FactoryGirl.build(:user, password: nil).valid?).to eq(false)
  end
  it "has many posts" do
    user = create(:user)
    create(:post, user_id: user.id)
    create(:post, user_id: user.id)
    expect(user.posts.size).to eq(2)
  end
end
