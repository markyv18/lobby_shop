class ScumbagsController < ApplicationController

  def index
    @scumbags = Scumbag.all
  end

  def show
    @scumbag = Scumbag.find(params[:id])
    # @deeds = @scumbag.deeds
    # @reviews = @scumbag.reviews
  end

end
