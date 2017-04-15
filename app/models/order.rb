class Order < ApplicationRecord
  validates :total_price, presence: true
  belongs_to :user
  has_many :scumbag_orders
  has_many :scumbags, through: :scumbag_orders

  enum status: %w(ordered paid cancelled completed)

  def format_created_date
    split_date = created_at.strftime("%A-%d-%B-%Y-%I-%M-%p").split('-')
      """
      #{split_date[0]} the #{split_date[1].to_i.ordinalize},
      #{split_date[2]} #{split_date[3]} at
      #{split_date[4]}:#{split_date[5]} #{split_date[6]}
      """
  end

  def add_items_to_order(cart)
    cart.contents.each do |scumbag_id, quantity|
      scumbag = Scumbag.find(scumbag_id.to_i)
      self.scumbag_orders.create(scumbag_id: scumbag.id,
                                   scumbag_quantity: quantity,
                                   scumbag_price: scumbag.price)
    end
  end

  # def total #use cart total at time of creating order instead
  #   scumbag_orders.map do |scumbag_order|
  #     scumbag_order.subtotal
  #   end.reduce(:+)
  # end

end
