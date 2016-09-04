class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :votes

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: { with: EMAIL_REGEX}, presence: true, uniqueness: true

  def name
    self.email.split("@")[0]
  end
end
