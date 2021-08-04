class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new # needed to instantiate the form_for
    @categories = ["chinese", "italian", "japanese", "french", "belgian"]
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    @restaurant.save!
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurants_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end

  private

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end