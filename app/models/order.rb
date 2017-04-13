class Order < ApplicationRecord
  belongs_to :user
  has_many :scumbag_orders
  has_many :scumbags, through: :scumbag_orders

  enum status: %w(ordered paid cancelled completed)

end
