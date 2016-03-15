class User < ActiveRecord::Base
  has_many :meals
  has_many :orders, through: :meals
  
  validates :uid, :name, presence: true
end
