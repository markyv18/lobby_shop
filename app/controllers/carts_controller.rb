class CartsController < ApplicationController

  def create
    scumbag = Scumbag.find(params[:scumbag_id])

    @cart.add_item(scumbag.id)
    session[:cart] = @cart.contents

    flash[:notice] = "Added #{scumbag.name} to cart."
    redirect_to scumbags_path
  end

end