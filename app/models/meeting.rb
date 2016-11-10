class Meeting < ApplicationRecord
	# before_*** callbacks
	before_save :set_default_status

	# Validation
	validates :knocker_id, presence: true
	validates :knockee_id, presence: true
	validates :meeting_type, presence: true

	# Associations
	belongs_to :knockee, class_name: 'User'
	belongs_to :knocker, class_name: 'User'

	# Methods

  # 3 status for meeting as below:
  # 0: pending
  # 1: approved
  # 2: rejected
	def set_default_status
	  self.status = 0 
	end
end
