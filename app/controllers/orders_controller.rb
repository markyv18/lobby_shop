class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(total_price: @cart.items_total, user_id: current_user.id)
    add_items_to_order
    reset_cart
    redirect_to orders_path
  end

#-----Where should we put these methods?

  def add_items_to_order
    @cart.contents.each do |scumbag_id, quantity|
      scumbag = Scumbag.find(scumbag_id.to_i)
      @order.scumbag_orders.create(scumbag_id: scumbag.id,
                                   scumbag_quantity: quantity,
                                   scumbag_price: scumbag.price)
    end
  end

  def reset_cart
    session[:cart] = {}
  end
end
