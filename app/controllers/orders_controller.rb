class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders.to_json
  end

  def create
    @order = Order.new(restaurant_name: order_params[:name])
    render json: @order.to_json if @order.save
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    render json: @order.to_json
  end

  private

  def order_params
    params.require(:order).permit(:name)
  end
end
