class PaymentMailer < ApplicationMailer
  helper_method :price, :call_time
  default from: "terrorgeek@gmail.com"
  def payment_success(receiver, card)
    @user, @card = receiver, card
    mail(to: @user.email, subject: "Your payment has been placed!")
  end

  def payment_failed(receiver, card)
    @user, @card = receiver, card
    mail(to: @user.email, subject: "Your payment was failed.")
  end
end
