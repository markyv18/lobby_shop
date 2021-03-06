class Admin::BaseController < ApplicationController
  before_action :require_admin

  def show
    if params[:status]
      @orders = Order.where(status: params[:status]).order(created_at: :desc)
    else
      @orders = Order.order(created_at: :desc)
    end
    @orders_count = Order.all.count
    @statuses = Order.statuses
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
