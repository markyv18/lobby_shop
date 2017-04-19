class Deed < ActiveRecord::Base
  validates :name,       presence: true
  has_many :scumbag_deeds
  has_many :scumbags, through: :scumbag_deeds
end
