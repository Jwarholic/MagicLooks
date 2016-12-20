class UserMirror < ApplicationRecord
	belongs_to :user, class_name: 'User'
	belongs_to :mirror, class_name: 'Mirror'
end
