class Admin::ScumbagsController < Admin::BaseController

  def index
    @scumbags = Scumbag.all
  end

  def new
    @scumbag = Scumbag.new
    @branches = Branch.all
    @parties = Party.all
  end

  def create
    final_params = scumbag_params
    final_params["image_path"] = "avatar"
    scumbag = Scumbag.new(final_params)
    if scumbag.save
      flash[:success] = "Successfully created #{scumbag.name}."
      redirect_to admin_scumbags_path
    else
      render :new
    end
  end

  def destroy

  end

  private

  def scumbag_params
    params.require(:scumbag).permit(:name, :price, :avatar, :party_id, :branch_id)
  end
end
