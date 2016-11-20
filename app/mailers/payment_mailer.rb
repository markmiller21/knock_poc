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

  def send_essay(knocker, cart)
    @knocker = knocker
    cart.each do |line_item|

    end
    knockee = User.find(cart.first["user_id"])
    attachments["#{knockee.display_name}-"] = File.read(File.join(Rails.root, 'public', knockee.college_essay_path.url)) #File.read(knockee.college_essay_path.url)
    mail(to: @knocker.email, subject: "Your essay is right here!")
  end
end
