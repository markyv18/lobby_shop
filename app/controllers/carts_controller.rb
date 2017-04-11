class CartsController < ApplicationController

  def create
    scumbag = Scumbag.find(params[:scumbag_id])
    flash[:notice] = "Added #{scumbag.name} to cart."
    redirect_to scumbags_path
  end

end