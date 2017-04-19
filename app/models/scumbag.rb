class Scumbag < ActiveRecord::Base
  validates :name,       presence: true,
                         uniqueness: true

  validates :price,      presence: true
  validates :image_path, presence: true
  belongs_to :party
  belongs_to :branch
  has_many :scumbag_orders
  has_many :orders, through: :scumbag_orders
  has_attached_file :avatar, styles: { medium: "604x759>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  enum status: %w(active retired)

  def party_abbreviation
    "(#{party.name[0].upcase})"
  end
end
