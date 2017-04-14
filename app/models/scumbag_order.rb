class ScumbagOrder < ApplicationRecord
  belongs_to :order
  belongs_to :scumbag

  def scumbag_name
    Scumbag.find(scumbag_id).name
  end

  def subtotal
    scumbag_price * scumbag_quantity
  end
end
