class MeetingSetupMailer < ApplicationMailer
  helper_method :price, :call_time
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

  def call_time(time)
    time.to_s[0..-7]
  end
end
