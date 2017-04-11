class Party < ActiveRecord::Base
  validates :name, uniqueness:true,
                   presence: true

  has_many :scumbags
end