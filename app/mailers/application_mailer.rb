class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def price(price, dviden)
    (price.to_f/dviden.to_f).round(2)
  end

  #this remove the last 6 chars from DateTime ruby class because sometimes there is a UTC or -0400 or something at the end
  # e.g. '2016-10-16 19:10:12 -0400' will be just '2016-10-16 19:10:12'
  def call_time(time)
    time.to_s[0..-7]
  end
end
