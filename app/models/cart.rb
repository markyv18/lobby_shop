class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def items
    @contents.map do |scumbag_id, quantity|
      scumbag = Scumbag.find(scumbag_id)
      CartItem.new(scumbag, quantity)
    end
  end

  def items_total
    return 0 if items.empty?
    items.map do |cart_item|
      cart_item.scumbag.price * cart_item.quantity.to_i
    end.reduce(:+)
  end

  def delete_scumbag(id)
    contents.delete(id)
  end

  def total_count
    contents.values.sum
  end

  def add_item(scumbag_id)
    contents[scumbag_id.to_s] ||= 0
    contents[scumbag_id.to_s] += 1
  end

  def count_of(scumbag_id)
    contents[scumbag_id.to_s]
  end

  def update_quantity(cart_params)
    @contents[cart_params[:scumbag_id]] = cart_params[:quantity].to_i
  end
end
