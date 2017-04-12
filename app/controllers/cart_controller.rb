class CartController < ApplicationController
  def index
    @cart_items = @cart.items
  end

  def create
    scumbag = Scumbag.find(params[:scumbag_id])

    @cart.add_item(scumbag.id)
    session[:cart] = @cart.contents

    flash[:notice] = "Added #{scumbag.name} to cart."
    redirect_to scumbags_path
  end

end
