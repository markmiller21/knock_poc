class MeetingSetupJob < ApplicationJob
  queue_as :default

  SINCH_API_URL = 'https://callingapi.sinch.com/v1/callouts'
  SINCH_API_KEY = '23caec4e-467a-486a-92f0-43c08b06ad56'
  SINCH_SECRET = 'nvxCFgLcgkuqkHxFqwXJEg=='
  SINCH_CALL_METHOD = 'conferenceCallout'

  #params:
  # 1, person1's phone, callee
  # 2, person2's phone, caller
  # 3, call's id(This is not the sinch's call id, it's the DB's call id) and identity, e.g: 34-callee
  def perform(*args)
    conference_id = UUID.generate
    send_request conference_id, args[0], "#{args[2]}-callee"
    send_request conference_id, args[1], "#{args[2]}-caller"
  end

  def send_request(conference_id, phone_number, db_call_id)
    rest_params = {
        "method" => SINCH_CALL_METHOD,
        "conferenceCallout" =>
            {
                "destination" => {"type" => "number", "endpoint" => phone_number},
                "domain" => "pstn",
                "custom" => db_call_id,
                "locale" => "en-US",
                "greeting" => "Welcome to my conference",
                "conferenceId" => conference_id,
                "enableAce" => false,
                "enableDice" => true
            }
    }
    res = RestClient.post SINCH_API_URL, JSON.generate(rest_params), {content_type: :json, :Authorization => 'Basic MjNjYWVjNGUtNDY3YS00ODZhLTkyZjAtNDNjMDhiMDZhZDU2Om52eENGZ0xjZ2t1cWtIeEZxd1hKRWc9PQ=='}
    puts "=======#{res.body}"
    puts "=======#{res.code}"
    res.body
  end
end
