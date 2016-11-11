class MeetingSetupMailer < ApplicationMailer
  helper_method :price, :call_time, :toggle_meeting_type, :toggle_price
  default from: "terrorgeek@gmail.com"

  def new_call_mail_knockee(knocker, knockee, meeting)
    @knocker, @knockee, @meeting = knocker, knockee, meeting
    mail(to: knockee.email, subject: "Someone Knocked!")
  end

  def new_call_mail_knocker(knocker, knockee, meeting)
    @knocker, @knockee, @meeting = knocker, knockee, meeting
    mail(to: knocker.email, subject: "Your Knock has been sent")
  end

  def accept_call_for_knocker_confirmation(knocker, knockee, meeting)
    @knocker, @knockee, @meeting = knocker, knockee, meeting
    mail(to: @knocker.email, subject: "Call accepted!")
  end

  def accept_call_for_knockee_confirmation(knocker, knockee, meeting)
    @knocker, @knockee, @meeting = knocker, knockee, meeting
    mail(to: @knockee.email, subject: "You just accepted the call from high schooler.")
  end

  def reject_call_for_knocker_confirmation(knocker, knockee, meeting, reject_reason)
    @knocker, @knockee, @meeting, @reject_reason = knocker, knockee, meeting, reject_reason
    mail(to: @knocker.email, subject: "Your call has been rejected.")
  end

  def reject_call_for_knockee_confirmation(knocker, knockee, meeting)
    @knocker, @knockee, @meeting = knocker, knockee, meeting
    mail(to: knockee.email, subject: "You just rejected the call from high schooler.")
  end

  def alternative_call_for_knocker(knocker, knockee, meeting, reschedule_time)
    @knocker, @knockee, @meeting, @reschedule_time = knocker, knockee, meeting, reschedule_time
    mail(to: @knocker.email, subject: "Alternative call from #{@knockee.display_name}.")
  end

  def price(price, dviden)
    (price.to_f/dviden.to_f).round(2)
  end

  #this remove the last 6 chars from DateTime ruby class because sometimes there is a UTC or -0400 or something at the end
  # e.g. '2016-10-16 19:10:12 -0400' will be just '2016-10-16 19:10:12'
  def call_time(time)
    time.to_s[0..-7]
  end

  #returns the text just for easily used in the mail view template
  def toggle_meeting_type(meeting)
    meeting.meeting_type == Constants::CALL_TYPE ? "call" : 'in-person meeting'
  end

  #this returns money, the dollar
  def toggle_price(meeting, knockee)
    meeting.meeting_type == Constants::CALL_TYPE ? knockee.phone_call_price : knockee.meeting_price
  end
end
