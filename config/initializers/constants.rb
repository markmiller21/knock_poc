#All Constants in this project will be in here since it's easy to store them in a all-in-one place
class Constants
  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  VALID_EMAIL_REGEX = /\A([^@\s]+)@georgetown.edu\Z/i
  VALID_US_CURRENCY = /\A^\d{1,3}(\.\d{0,2})?$\Z/
  VALID_TIME = /\A^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$\Z/

  #keep this, maybe we need it later
  CALL_TYPE = 'call'
  IN_PERSON_TYPE = 'in_person'
  VIDEO_TYPE = 'video'

  MEETING_TYPES = {CALL_TYPE => 'Phone Call', IN_PERSON_TYPE => 'In-Person Meeting', VIDEO_TYPE => 'Video Call'}

  SINCH_API_URL = 'https://callingapi.sinch.com/v1/callouts'
  SINCH_API_KEY = '23caec4e-467a-486a-92f0-43c08b06ad56'
  SINCH_SECRET = 'nvxCFgLcgkuqkHxFqwXJEg=='
  SINCH_CALL_METHOD = 'conferenceCallout'

  #we temporoaly set all essay price to $5, if there is some changes, we can remove this
  ESSAY_DEFAULT_PRICE = 5

  #Stripe API KEYs
  STRIPE_API_PUBLISHABLE_KEY = 'pk_test_nIplpPKMZLX2RsglbSfcHY6H'
  STRIPE_API_SECRET_KEY = 'sk_test_Qe3pGLNi0JcT9scG6Au6cs7O'
end