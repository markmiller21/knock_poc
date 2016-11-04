class Meeting < ApplicationRecord
	belongs_to :knockee_id, :class_name => 'User'
	belongs_to :knocker_id, :class_name => 'User'

	# Validate the presence of knockee_id & knocker_id
end
