class Order < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :users, through: :meals
  
  validates :restaurant_name, :status, presence: true
  validates :status, inclusion: { in: %w(Opened Finalized Ordered Delivered) }

  scope :active, -> { where.not(status: 'Finalized') }
  scope :history, -> { where(status: 'Finalized') }
end
