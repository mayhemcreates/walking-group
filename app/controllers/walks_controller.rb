class WalksController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def index
    @walks = Walk.all.order(day: :asc)
    @walks.each do |walk|
      if walk.day.before?(Date.today)
        walk.visible = false
        walk.save
      end
      @marker = { lat: walk.latitude, lng: walk.longitude }
    end
    visible_walks = Walk.where(visible: true)
    if visible_walks.count <=12
      Walk.create!(day: calculate_next_thursday(Walk.last.day), location: '', leader: '', visible: true)
    end
  end

  def show
    @walk = Walk.find(params[:id])
    @marker = { lat: @walk.latitude, lng: @walk.longitude }
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
    params.require(:walk).permit(:location, :leader, :notes, :postcode)
  end

  def calculate_next_thursday(date)
    new_date = date + 6
    new_date.next_occurring(:thursday)
  end

end
