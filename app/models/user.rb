class User < ApplicationRecord
	validates :name, :email, presence: true
	has_secure_password
	has_many :comments
	has_many :posts
end
