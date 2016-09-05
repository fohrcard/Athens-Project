class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: { with: EMAIL_REGEX}, presence: true, uniqueness: true

  def as_json(options={})
    {
      id: self.id,
      name: self.name,
      age: self.age,
      country: self.country,
      gender: self.gender,
      flags: self.flag,
      karma: self.karma,
    }
  end

  def name
    self.email.split("@")[0]
  end

  def karma
    self.votes.count - self.posts.count
  end

  def posts_to_review
    # get the posts I have already voted on
    voted_post_ids = self.votes.pluck(:post_id)
    # get the posts that are not the users own or already voted on
    Post.where.not(user_id: self.id).where.not(id: voted_post_ids).order(created_at: :desc)
  end

  def self.payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end
