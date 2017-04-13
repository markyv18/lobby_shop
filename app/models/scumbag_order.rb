class ScumbagOrder < ApplicationRecord
  belongs_to :order
  belongs_to :scumbag
end
