class Meal < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates_uniqueness_of :user_id, scope: :order_id
end
