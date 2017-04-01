class Match < ApplicationRecord
	belongs_to :user
	belongs_to :matched_user, class_name: "User"

	validates :user_id, :matched_user_id, :completion_status

	scope :ordered, -> { order('created_at desc') }
end
