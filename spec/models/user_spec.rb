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

  it "has a username" do
    user = create(:user, email: "bestname@example.com")
    expect(user.name).to eq("bestname")
  end

  describe "votes" do
    it "has many" do
      user = create(:user)
      post1 = create(:post, user_id: user.id)
      post2 = create(:post, user_id: user.id)
      user.votes.create(post_id: post1.id, image_one: false)
      user.votes.create(post_id: post2.id, image_one: false)
      expect(user.votes.size).to eq(2)
    end

    it "can get non voted on posts" do
      user = create(:user)
      2.times do
        post = create(:post, user_id: create(:user).id)
        user.votes.create!(post_id: post.id, image_one: false)
      end
      3.times do
        create(:post, user_id: create(:user).id)
      end
      expect(Post.all.count).to eq(5)
      expect(user.posts_to_review.size).to eq(3)
    end
  end

  describe "karama" do
    it "can be positive" do
      user = create(:user)
      2.times do
        create(:post, user_id: user.id)
      end
      5.times do
        user.votes.create(post_id: create(:post, user_id: create(:user).id), image_one: false)
      end
      expect(user.karma).to eq(3)
    end
    it "can be negitive" do
      user = create(:user)
      5.times do
        create(:post, user_id: user.id)
      end
      2.times do
        user.votes.create(post_id: create(:post, user_id: create(:user).id), image_one: false)
      end
      expect(user.karma).to eq(-3)
    end
  end
end
