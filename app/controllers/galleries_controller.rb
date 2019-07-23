class GalleriesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @galleries = Gallery.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to galleries_path
    else
      render :new
    end
  end

  def destroy
    gallery = Gallery.find(params[:id])
    if gallery.user_id == current_user.id
      gallery.destroy
      redirect_to galleries_path
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @gallery.image.cache! unless @gallery.image.blank?
  end

  def update
    gallery = Gallery.find(params[:id])
    if gallery.user_id == current_user.id
      gallery.update(gallery_params)
      redirect_to galleries_path
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
