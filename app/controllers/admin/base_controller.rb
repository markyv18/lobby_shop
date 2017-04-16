class Admin::BaseController < ApplicationController
  before_action :require_admin

  def show
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
    @statuses = Order.statuses
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
