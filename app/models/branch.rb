class Branch < ActiveRecord::Base
  validates :name, uniqueness: true,
                   presence: true

  validates_presence_of :slug

  has_many :scumbags

  def to_param
    slug
  end
end
