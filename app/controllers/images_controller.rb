class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @images = Image.order("created_at DESC").paginate(page: params[:page], per_page: 50)
  end

  def show
  end

  def show_user_images
    @images = current_user.images.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:notice] = "New image shared!"
      redirect_to @image
    else
      flash[:error] = "Uh oh, something went wrong uploading it.."
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      flash[:notice] = "image updated"
      redirect_to @image
    else
      flash[:error] = "Uh oh, something went wrong updating it.."
      render action: 'edit'
    end
  end

  def destroy
    if @image.destroy
      flash[:alert] = "image deleted."
      redirect_to root_path
    else
      flash[:error] = "Uh oh, something went wrong deleting it.."
    end
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    def correct_user
      @image = current_user.images.find_by(id: params[:id])
      if @image.nil?
        flash[:notice] = "You're not authorized to do this!"
        redirect_to root_path
      end
    end

    def image_params
      params.require(:image).permit(:description, :image)
    end
end