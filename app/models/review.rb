class Review < ActiveRecord::Base
  validates :title,       presence: true
  validates :body,       presence: true
  has_many :scumbag_reviews
  has_many :scumbags, through: :scumbag_reviews
end
