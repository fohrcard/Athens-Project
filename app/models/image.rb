class Image < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :votes

  def total_votes
    self.votes.count
  end
end
