class WorksController < ApplicationController

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
    Work.create(work_params)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy if article.user_id == current_user.id
  end

  def edit
  end

  def update
  end

  private

  def work_params
    params.require(:work).permit(:title, :image, :category, :period, :skill, :charge, :detail, :summary).merge(user_id: current_user.id)
  end
end