class Meeting < ApplicationRecord
	# Validation
	validates :knocker_id, presence: true
	validates :knockee_id, presence: true
	validates :type, presence: true

	# Associations
	belongs_to :knockee, class_name: 'User'
	belongs_to :knocker, class_name: 'User'
end
