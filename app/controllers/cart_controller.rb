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

  def update

    @cart.update_quantity(params[:qty_update])
    session[:cart] = @cart.contents
    redirect_to cart_index_path
  end

  def destroy
    @cart.delete_scumbag(params[:id])
    scumbag = Scumbag.find(params[:id])
    session[:cart] = @cart.contents
    flash[:success] = "Successfully removed the scumbag known as #{view_context.link_to scumbag.name, scumbag_path(scumbag) }!"
    redirect_to cart_index_path
  end

end
