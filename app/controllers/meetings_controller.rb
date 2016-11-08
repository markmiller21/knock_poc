class MeetingsController < ApplicationController
  def create
  	#TODO I need devise integration finished to finish meeting creation.
  	@meeting = Meeting.new(meeting_params)

    #now we need to assign some info that needs to be get from other models that can't get
    #directly from the form
    @knockee = User.find(meeting_params[:knockee_id])
    knocker = User.find(meeting_params[:knocker_id])
    @meeting.meeting_price = @knockee.phone_call_price

    #only if the meeting saved, then schedule the call if its type is 'call'
    if @meeting.save && @meeting.meeting_type == Constants::CALL_TYPE
      time_to_call = Time.zone.parse("#{@meeting.call_time} -0400") - Time.zone.now
      MeetingSetupJob.set(wait: time_to_call.seconds).perform_later("+1#{@knockee.cell_phone}", "+1#{knocker.cell_phone}", @meeting.id)
    end
  end

  private 
  #TODO we may need bunch of ***_params for every record creation based on strong parameters, may need 
  #to create a generic method to handle strong parameters
  def meeting_params
    params.require(:meeting).permit!
  end
end
