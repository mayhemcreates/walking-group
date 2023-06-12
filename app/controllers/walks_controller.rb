class WalksController < ApplicationController
  def index
    @walks = Walk.all.order(date: :asc)
  end

  def show
    @walk = Walk.find(params[:id])
  end

  def new
    @walk = Walk.new
  end

  def create
    @walk = Walk.new(walk_params)
    @walk.save
    if @walk.save
      redirect_to root
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @walk = Walk.find(params[:id])
  end

  def update
    @walk = Walk.find(params[:id])
    @walk.update(walk_params)
    redirect_to walks_path
  end

  private

  def walk_params
    params.require(:walk).permit(:location, :leader)
  end

end
