json.meals @meals do |meal|
  json.id meal.id
  json.name meal.name
  json.price meal.price
end
