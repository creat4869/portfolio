class WorksController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @works = Work.includes(:user).page(params[:page]).per(12).order("created_at DESC")
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy if work.user_id == current_user.id
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  private

  def work_params
    params.require(:work).permit(:title, :image, :category, :period, :skill, :charge, :detail, :summary).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
