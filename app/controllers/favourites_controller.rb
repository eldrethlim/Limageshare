class FavouritesController < ApplicationController
  before_action :set_image
  before_action :set_favourite, only: [:destroy]
  before_action :correct_user, only: [:destroy]
  before_action :authenticate_user!
  respond_to :html, :js

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = @image.favourites.build(favourite_params)
    @favourite.user = current_user
    if @favourite.save
      flash.clear
      flash[:notice] = "Favourited this image!"
    else
      flash.clear
      flash[:error] = "Uh oh, something went wrong!"
    end

    redirect_to :back
  end

  def destroy
    if @favourite.destroy
      flash.clear
      flash[:notice] = "Unfavourited this image!"
    else
      flash.clear
      flash[:error] = "Uh oh, something went wrong!"
    end

    redirect_to :back
  end

  private

    def set_image
      @image = Image.find(params[:image_id])
    end

    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    def correct_user
      @favourite = current_user.favourites.find_by(id: params[:id])
      if @favourite.nil?
        flash[:notice] = "You can't do this!"
        redirect_to root_path
      end
    end

    def favourite_params
      params.require(:favourite).permit(:image_id, :user_id)
    end
end