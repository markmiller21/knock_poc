class Transaction < ApplicationRecord
	belongs_to :knockee_id, :class_name => 'User'
	belongs_to :knocker_id, :class_name => 'User'
end
