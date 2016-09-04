class Post < ApplicationRecord
  belongs_to :user
  has_many :votes

  # Benchmark count vs ruby select across all vote counts
  # db: @real=0.027787707003881223
  # ruby: @real=0.24628183399909176
  def total_votes
    votes.count
  end
  def image_one_total_votes
    votes.where(image_one: true).count
  end
  def image_two_total_votes
    votes.where(image_one: false).count
  end
end
