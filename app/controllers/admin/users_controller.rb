class Admin::UsersController < Admin::BaseController

  def edit

  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to admin_dashboard_path
      flash[:success] = "Account successfuly updated."
    else
      flash.now[:failure] = current_user.errors.full_messages
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
