require 'date'

class WalksController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def index
    Walk.all.each do |walk|
      if walk.day >= Date.today
        @walks = Walk.all.order(day: :asc)
      end
    end
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
