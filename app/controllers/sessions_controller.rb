class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: username)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
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

  def username
    params[:session][:username]
  end

  def password
    params[:session][:password]
  end
end
