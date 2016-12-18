class User < ApplicationRecord
	has_many :mirrors, foreign_key: "owner_id"
	has_many :user_mirrors
	validates :name, :email, presence: true
	has_secure_password
end
