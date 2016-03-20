class Order < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :users, through: :meals
  
  validates :restaurant_name, :status, presence: true

  scope :active, -> { where.not(status: 'Finalized') }
  scope :history, -> { where(status: 'Finalized') }
end
