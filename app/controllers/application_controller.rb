class ApplicationController < ActionController::Base

  before_action :set_cart
  helper_method :current_user
  helper_method :logged_in?
  protect_from_forgery with: :exception

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = User.new(username: "Guest")
    end
  end

end
