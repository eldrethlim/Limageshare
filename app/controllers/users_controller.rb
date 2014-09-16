class UsersController < ApplicationController
  before_action :set_user, only: [:show_images]
  before_filter :authenticate_user!, except: [:show_images]

  def show_images
    @images = @user.images.all.order("created_at DESC").paginate(page: params[:page], per_page: 50)
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Account information updated!"
    end
    redirect_to edit_user_registration_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end