class ScumbagsController < ApplicationController

  def index
    @scumbags = Scumbag.all
  end

  def show
    @scumbag = Scumbag.find(params[:id])
  end

end