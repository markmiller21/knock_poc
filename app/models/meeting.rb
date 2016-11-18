class Meeting < ApplicationRecord
	# before_*** callbacks
	before_save :set_default_status

	# Validation
	validates :knocker_id, :meeting_time, :knockee_id, :meeting_type, presence: true
	validates :meeting_location, presence: true, if: "self.meeting_type=='#{Constants::IN_PERSON_TYPE}'"
	validate :meeting_time_later_than_now?

	# Associations
	belongs_to :knockee, class_name: 'User'
	belongs_to :knocker, class_name: 'User'
	has_one :transaction

	# Methods

  # 3 status for meeting as below:
  # 0: pending
  # 1: approved
  # 2: rejected
	def set_default_status
	  self.status = 0 
	end

	#we need to make sure the teh meeting time is later than now so that it make sense
	def meeting_time_later_than_now?
		if self.meeting_time < DateTime.now
      errors.add(:meeting_time, "Meeting time must be later than now!")
		end
	end

	def get_price_by_meeting_type(knocker, duration)
		#now the price is 15 mins unit ,right?
		if self.meeting_type == Constants::CALL_TYPE
			(knocker.phone_call_price.to_f / Constants::PRICE_TIME_UNIT.to_f) * duration.to_f
		else
			#we know that this is not gonna happen, but just put it here in case of future.
			return 1
		end
	end
end
