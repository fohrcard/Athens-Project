puts "Seeding"
ActiveRecord::Base.transaction do
  # Create users and posts
  5.times do
    pass = Faker::Internet.password
    user = User.create(email: Faker::Internet.email, password: pass, password_confirmation: pass)
    3.times do
      FactoryGirl.create(:post, user_id: user.id)
    end
  end

  User.all.each do |user|
    posts = user.posts_to_review
    posts[0..-3].each do |post|
      user.votes.create!(post_id: post.id)
    end
  end
end
