json.orders @orders do |order|
  json.id order.id
  json.restaurant_name order.restaurant_name
  json.status order.status
end
