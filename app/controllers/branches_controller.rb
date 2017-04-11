class BranchesController < ApplicationController

  def show
    @branch = Branch.find_by_slug(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
