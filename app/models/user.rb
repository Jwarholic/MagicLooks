class User < ApplicationRecord
	has_secure_password
  
  validates :name, :email, presence: true

  has_many :owned_mirrors, foreign_key: "owner_id"
  has_many :user_mirrors
  has_many :mirrors, through: :user_mirrors
end
