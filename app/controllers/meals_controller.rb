class MealsController < ApplicationController
  def index
    @meals = Meal.where(order_id: params[:order_id])
    render json: @meals.to_json
  end
end
