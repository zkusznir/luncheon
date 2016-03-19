class MealsController < ApplicationController
  before_action :logged_in
  
  def index
    @meals = Meal.where(order_id: params[:order_id])
    render json: @meals.to_json
  end

  def create
    @meal = current_user.meals.create(name: meal_params[:name],
                                      price: meal_params[:price],
                                      order_id: params[:order_id],
    render json: @meal.to_json
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price)
  end
end
