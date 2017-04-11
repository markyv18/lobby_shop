class Scumbag < ActiveRecord::Base
  validates :name,       presence: true,
                         uniqueness: true

  validates :price,      presence: true
  validates :image_path, presence: true


  belongs_to :party
  belongs_to :branch

  def party_abbreviation
    "(#{party.name[0].upcase})"
  end
end
