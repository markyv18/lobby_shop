class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: username)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      check_login_redirect(user)
    else
      flash.now[:failure] = "Login unsuccessful."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def check_login_redirect(user)
    user.admin? ? redirect_to(admin_dashboard_path) : redirect_to(root_path)
  end

  def username
    params[:session][:username]
  end

  def password
    params[:session][:password]
  end
end
