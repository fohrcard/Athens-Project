class User < ApplicationRecord
  has_secure_password

  has_many :posts

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: { with: EMAIL_REGEX}, presence: true, uniqueness: true
end
