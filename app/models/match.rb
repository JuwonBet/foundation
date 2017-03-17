class Match < ApplicationRecord
	belongs_to :user
	belongs_to :matched_user, class_name: "User"

	scope :ordered, -> { order('created_at desc') }
end
