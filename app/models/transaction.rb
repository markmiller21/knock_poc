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

	before_validation(on: :create) do
		#similar with meeting
		# 3 status for transactions as below:
		# 0: pending
		# 1: approved
		# 2: rejected
		self.status = 0 if self.status.blank?
	end

	#here we just make the donate to philanthropy into a method so that it can be called
	#whenever it need, and this method needs a knockee as param cause the philanthropy percent
	#is in there
	def donate_to_charity(knockee)
		if knockee.philanthropy_percent
			self.money_for_philanthropy = (knockee.philanthropy_percent).to_f/100 * self.price
			self.price -= self.money_for_philanthropy
		end
		self.money_for_philanthropy || 0.00
	end
end
