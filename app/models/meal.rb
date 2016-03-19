class Meal < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  validates :name, :price, :user_id, :order_id, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :user_id, uniqueness: { scope: :order_id }
end
