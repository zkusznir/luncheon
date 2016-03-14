class User < ActiveRecord::Base
  validates :uid, :name, presence: true
end
