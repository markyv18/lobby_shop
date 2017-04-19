class Scumbag < ActiveRecord::Base
  validates :name,       presence: true,
                         uniqueness: true

  validates :price,      presence: true
  validates :image_path, presence: true
  belongs_to :party
  belongs_to :branch
  has_many :scumbag_orders
  has_many :orders, through: :scumbag_orders

  has_many :scumbag_deeds
  has_many :deeds, through: :scumbag_deeds

  has_many :scumbag_reviews
  has_many :reviews, through: :scumbag_reviews

  enum status: %w(active retired)

  def party_abbreviation
    "(#{party.name[0].upcase})"
  end
end
