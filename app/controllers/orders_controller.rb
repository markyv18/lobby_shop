class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(total_price: @cart.items_total, user_id: current_user.id)
    @order.add_items_to_order(@cart)
    reset_cart
    redirect_to orders_path
  end

  private

  def reset_cart
    session[:cart] = {}
  end
end
