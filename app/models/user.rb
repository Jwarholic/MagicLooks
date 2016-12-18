class User < ApplicationRecord
	has_secure_password
  validates :name, :email, presence: true

  has_many :mirrors, foreign_key: "owner_id"
  has_many :user_mirrors
  has_many :mirrors, through: :user_mirrors, source: :mirror_id
end
