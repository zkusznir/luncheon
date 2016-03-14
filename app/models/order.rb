class Order < ActiveRecord::Base
  validates :restaurant_name, :status, presence: true
  validates :status, inclusion: { in: %w(Finalized Ordered Delivered) }
end
