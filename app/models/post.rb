class Post < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates :user_id, :image_one, :image_two, presence: true

  def as_json(options={})
    total_votes = self.total_votes
    img1_total = image_one_total_votes
    img2_total = image_two_total_votes
    img1_perc = build_percentage_of_vote(img1_total, total_votes)
    img2_perc = build_percentage_of_vote(img2_total, total_votes)
    {
      id: self.id,
      created_at: self.created_at,
      user: {
        name: self.user.name,
        country: self.user.country
      },
      image_one: {
        url: self.image_one,
        percentage: img1_perc,
        total: img1_total,
        lead: (img1_total > img2_total)
      },
      image_two: {
        url: self.image_two,
        percentage: img2_perc,
        total: img2_total,
        lead: (img1_total < img2_total)
      },
      overall_voters: total_votes
    }
  end

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
  def image_one_vote_percentage
    (image_one_total_votes.to_f / total_votes * 100).round(2) rescue 0
  end
  def image_two_vote_percentage
    (image_one_total_votes.to_f / total_votes * 100).round(2) rescue 0
  end

  private
    def build_percentage_of_vote(img, total)
      (img.to_f / total * 100).round(1) rescue 0
    end

end
