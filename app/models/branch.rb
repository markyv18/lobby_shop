class Branch < ActiveRecord::Base
  before_save :generate_slug

  validates :name, uniqueness: true,
                   presence: true

  validates_presence_of :slug

  has_many :scumbags

  def to_param
    slug
  end

  def self.find(input)
    if input.to_i != 0
      super
    else
      find_by_slug(input)
    end
  end

  def generate_slug
    self.slug = name.parameterize
  end
end