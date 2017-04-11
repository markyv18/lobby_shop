class ScumbagsController < ApplicationController

  def index
    @scumbags = Scumbag.all
  end
  
end