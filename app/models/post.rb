class Post < ApplicationRecord
  belongs_to :user
  has_many :images

  def total_votes
    images.map{|t| t.total_votes }.sum
  end
end
