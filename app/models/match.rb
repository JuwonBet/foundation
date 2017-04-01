class Match < ApplicationRecord
	before_save :set_completion_status

	belongs_to :user
	belongs_to :matched_user, class_name: "User"

	validates :user_id, :matched_user_id, presence: true

	scope :ordered, -> { order('created_at desc') }

	def set_completion_status
		self.completion_status = 'pending'
	end

end
