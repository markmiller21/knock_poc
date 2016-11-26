class MeetingsController < ApplicationController
  before_action :authenticate_user!, except: [:disconnect_call_back]
  before_action :set_knocker_knockee_meeting, except: [:create, :disconnect_call_back]
  skip_before_action :verify_authenticity_token, only: [:disconnect_call_back]

  def index
    # Grab the all the Knocker & Knockee meetings
    # Todo: seperate them into previous meetings and upcoming meetings
    @knockee_meetings = Meeting.where(knockee_id: current_user.id)
    @knocker_meetings = Meeting.where(knocker_id: current_user.id)
  end

  def show
    # TODO: change the @knockee & @knocker references to @meeting.knockee / @meeting.knocker
    @meeting = Meeting.find(params[:id])
    @knockee = @meeting.knockee
    @knocker = @meeting.knocker

    #TODO I temproraly put this in here, once we get video design done, I will move this.
    #------   Sinch Video call code   ------
    #below code are from since official gem 'sinch_auth', SinchAuth class and get_auth_ticket method are provided by the gem.
    sinchAuth = SinchAuth.new
    @ticket = sinchAuth.get_auth_ticket(current_user.email, 3600, Constants::SINCH_API_KEY, Constants::SINCH_SECRET)
  end


  def create
    #First we need to see whether the user already has CC setup.
    if current_user.stripe_customer_id.blank?
      return
    end
    # use the format date method to massage the data to get it in proper form
    meeting_params[:meeting_time] = format_date_to_db(meeting_params[:meeting_time])

  	#TODO I need devise integration finished to finish meeting creation.
  	@meeting = Meeting.new(meeting_params)

    #now we need to assign some info that needs to be get from other models that can't get
    #directly from the form
    @knockee = User.find(meeting_params[:knockee_id])
    knocker = User.find(meeting_params[:knocker_id])
    @meeting.meeting_price = @knockee.phone_call_price

    #only if the meeting saved, then schedule the call if its type is 'call'
    if @meeting.save
      MeetingSetupMailer.new_call_mail_knockee(knocker, @knockee, @meeting).deliver_now
      MeetingSetupMailer.new_call_mail_knocker(knocker, @knockee, @meeting).deliver_now
    end
  end


  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    if @meeting.update(Meeting::permitted(params))
      meetings(current_user)
    else
      render :edit
    end
  end

  #basically all below actions need to pass 3 params by the URL queries, which is by GET or POST method:
  #1, knocker_id
  #2, knockee_id
  #3, meeting_id
  def accept_call
    @meeting.update_column('status', 1)
    time_to_call = Time.zone.parse("#{@meeting.meeting_time} -0400") - Time.zone.now
    MeetingSetupJob.set(wait: time_to_call.seconds).
        perform_later("+1#{@knockee.cell_phone}",
                      "+1#{@knocker.cell_phone}", 
                      @meeting.id) if @meeting.meeting_type == Constants::CALL_TYPE

    MeetingSetupMailer.accept_call_for_knocker_confirmation(@knocker, @knockee, @meeting).deliver_now
    MeetingSetupMailer.accept_call_for_knockee_confirmation(@knocker, @knockee, @meeting).deliver_now
  end


  def alternative_time
    #only if the form_action is present, then we do the action that needed, same as in reject_reason
    if params[:form_action]
      @meeting.update_column('reschedule_time', params[:reschedule_time])
      MeetingSetupMailer.alternative_call_for_knocker(@knocker, @knockee, @meeting, params[:alternative_time]).deliver_now
      redirect_to alternative_time_confirm_meetings_path
    end
  end

  def reject_reason
    if params[:form_action]
      @meeting.update_column('status', 2)
      @meeting.update_column('reject_reasons', params[:reject_reasons])
      MeetingSetupMailer.reject_call_for_knocker_confirmation(@knocker, @knockee, @meeting, params[:reject_reasons]).deliver_now
      MeetingSetupMailer.reject_call_for_knockee_confirmation(@knocker, @knockee, @meeting).deliver_now
      redirect_to reject_call_meetings_path
    end
  end

  #this is the callback action when caller and callee hangup the phone, this is
  # configured on Sinch dashboard, which is very important
  def disconnect_call_back
    #We only count the price when the first guy hangup
    #The Dice callback will return us a JSON, it contains the duration time of the call and some custom data
    #The params[:custom] stores the corresponding meeting id, which will be used to find the knocker and charge him
    begin
      meeting = Meeting.find(params[:custom])
      duration = params[:duration].to_i
      if meeting && meeting.meeting_transaction.blank?
        knocker = User.find (meeting.knocker_id)
        knockee = User.find(meeting.knockee_id)
        price = meeting.get_price_by_meeting_type(knocker, duration)

        transaction = meeting.build_meeting_transaction(knocker_id: meeting.knocker_id, knockee_id: meeting.knockee_id,
                                           price: price, duration: duration)
        #donate money to charity no matter how much the philanthropy_percent is
        money_donated = transaction.donate_to_charity(knockee)
        knockee.update_column("total_money_donated", knockee.total_money_donated + money_donated)
        transaction.save
        knocker.pay_with_current_bank_or_create((price*100).to_i)
      end
    rescue ActiveRecord::RecordNotFound
      render text: 'The parameter you sent is invalid, make sure you are operating within the website.' and return
    end
    render json: "success"
  end

  private 
  #TODO we may need bunch of ***_params for every record creation based on strong parameters, may need 
  #to create a generic method to handle strong parameters
  def meeting_params
    params.require(:meeting).permit!
  end

  #like mentioned above, here to make sure all 3 params are present
  # in other words, @knocker, @knockee and @meeting must be present in those actions
  def set_knocker_knockee_meeting
    if params[:meeting_id].present? && params[:knockee_id].present? && params[:knocker_id].present?
      @knocker = User.find(params[:knocker_id])
      @knockee = User.find(params[:knockee_id])
      @meeting = Meeting.find(params[:meeting_id])
    end
  end

  # TODO: move this to a helper file
  # This converts the datetimepicker gem data into db/ ruby friends dateTime format
  def format_date_to_db(date)
    original_date_array = date.split(' ')
    
    # logic to convert to military time
    time = original_date_array[1].split(':')
    hour = time[0].to_i
    original_date_array[2] == 'PM' ? hour += 12 : hour
    time[0]=hour.to_s
    
    # arrange date in proper format for DB
    proper_date = original_date_array[0].split('/').rotate(2).join('-')
    proper_time = time.push('00').join(':')
    return proper_date + ' ' + proper_time
  end
end
