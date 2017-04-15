class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.username}"
      redirect_to dashboard_path(user_id: @user.id)
    else
      flash.now[:failure] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
