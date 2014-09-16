class UsersController < ApplicationController
  before_filter :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Account information updated!"
    end
    redirect_to edit_user_registration_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end