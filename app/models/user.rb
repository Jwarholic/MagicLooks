class User < ApplicationRecord
	has_many :mirrors
	validates :name, :email, presence: true
	has_secure_password
end
