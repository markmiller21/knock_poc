class Transaction < ApplicationRecord
	belongs_to :knockee, :class_name => 'User'
	belongs_to :knocker, :class_name => 'User'

	# Validate the presence of knockee_id & knocker_id
end
