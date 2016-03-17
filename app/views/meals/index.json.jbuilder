json.meals @meals do |meal|
  json.partial! 'meal', meal: meal
end
