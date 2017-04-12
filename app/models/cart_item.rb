class CartItem

  attr_reader :scumbag, :quantity

  def initialize(scumbag, quantity)
    @scumbag = scumbag
    @quantity = quantity
  end

  def subtotal
    scumbag.price * quantity.to_i
  end

end
