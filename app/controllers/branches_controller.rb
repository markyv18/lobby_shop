class BranchesController < ApplicationController

  def show
    @branch = Branch.find(params[:category_slug])
    @scumbags = @branch.scumbags
  end

  private

end
