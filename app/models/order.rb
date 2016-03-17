class Order < ActiveRecord::Base
  has_many :meals
  has_many :users, through: :meals
  
  validates :restaurant_name, presence: true
end
