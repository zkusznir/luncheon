class MealsController < ApplicationController
  before_action :logged_in
  
  def index
    @meals = Meal.where(order_id: params[:order_id])
    render json: @meals.to_json
  end

  def create
    @meal = current_user.meals.new(name: meal_params[:name],
                                      price: meal_params[:price],
                                      order_id: params[:order_id])
    if @meal.save
      render json: @meal.to_json
    else
      render json: { error: 'Fuck' }.to_json
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price)
  end
end
