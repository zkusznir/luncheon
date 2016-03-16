FactoryGirl.define do
  factory :user do
    uid '123456'
    name 'John Doe'
  end

  factory :order do
    restaurant_name 'Burger Love'
    status 'Delivered'
  end

  factory :meal do
    name 'Gonzales'
    price 21.5
    order
    user
  end
end
