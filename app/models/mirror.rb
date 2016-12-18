class Mirror < ApplicationRecord
	belongs_to :owner, class_name: 'User'
	has_many :user_mirrors
end
