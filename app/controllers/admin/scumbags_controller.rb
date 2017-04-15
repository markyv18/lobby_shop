class Admin::ScumbagsController < Admin::BaseController

  def index
    @scumbags = Scumbag.all
  end

  def new

  end

  def create

  end

  def destroy

  end
end
