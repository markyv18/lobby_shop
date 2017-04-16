class Admin::BaseController < ApplicationController
  before_action :require_admin

  def show
    @orders = Order.all
    @statuses = Order.statuses
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
