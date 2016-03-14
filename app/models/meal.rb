class Meal < ActiveRecord::Base
  validates :meal, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
