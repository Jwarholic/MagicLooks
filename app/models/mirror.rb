class Mirror < ApplicationRecord
	belongs_to :owner, class_name: 'User'
	has_many :user_mirrors
  has_many :users, through: :user_mirrors, source: 'user_id'
end
