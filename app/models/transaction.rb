class Transaction < ApplicationRecord
	# Validation
	validates :knocker_id, presence: true
	validates :knockee_id, presence: true
	validates :status, presence: true
	validates :price, presence: true
	validates :duration, presence: true

	# Associations
	belongs_to :knockee, class_name: 'User'
	belongs_to :knocker, class_name: 'User'
	belongs_to :meeting

	before_save(on: :create) do
		#similar with meeting
		# 3 status for transactions as below:
		# 0: pending
		# 1: approved
		# 2: rejected
		self.status = 0
	end
end
