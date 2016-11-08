class Constants
  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  VALID_EMAIL_REGEX = /\A([^@\s]+)@georgetown.edu\Z/i
  VALID_US_CURRENCY = /\A^\d{1,6}(\.\d{0,2})?$\Z/
  VALID_TIME = /\A^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$\Z/

  CALL_TYPE = 'call'
  IN_PERSON_TYPE = 'in_person'
end