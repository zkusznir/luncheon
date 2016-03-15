class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders.to_json
  end
end
