class BranchesController < ApplicationController

  def show
    @branch = Branch.find(params[:category_slug])
    @scumbags = @branch.scumbags
  end

  def index
    @branches = Branch.all
  end

  private

end
