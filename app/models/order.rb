class Order < ActiveRecord::Base
  has_many :meals
  has_many :users, through: :meals
  
  validates :restaurant_name, :status, presence: true
  validates :status, inclusion: { in: %w(Finalized Ordered Delivered) }
end
