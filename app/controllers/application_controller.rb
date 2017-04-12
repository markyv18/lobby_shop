class ApplicationController < ActionController::Base

  before_action :set_cart

  protect_from_forgery with: :exception

  def set_cart
    @cart = Cart.new(session[:cart])
  end
end
