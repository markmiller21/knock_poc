class MeetingsController < ApplicationController
  def create
  	#TODO I need devise integration finished to finish meeting creation.
  	@meeting = Meeting.new(meeting_params)
  	@meeting.save
  end

  private 
  #TODO we may need bunch of ***_params for every record creation based on strong parameters, may need 
  #to create a generic method to handle strong parameters
  def meeting_params
    params.require(:meeting).permit!
  end
end
