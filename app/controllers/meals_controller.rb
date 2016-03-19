class MealsController < ApplicationController
  def index
    @meals = Meal.where(order_id: params[:order_id])
    render json: @meals.to_json
  end

  def create
    @meal = Meal.create(name: meal_params[:name],
                        price: meal_params[:price],
                        order_id: params[:order_id],
                        user: current_user)
    render json: @meal.to_json
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price)
  end
end
