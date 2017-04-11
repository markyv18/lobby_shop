class OfficialsController < ApplicationController

  def index
    @officials = Official.all
  

  end

end
