FactoryGirl.define do
  factory :user do
    email "nimabi@gmail.com"
    password "1234567890"
    first_name "Yu"
    last_name "Song"
  end

  # factory :user do
  #   email "wocao@gmail.com"
  #   password "1234567890"
  #   first_name "Niu"
  #   last_name "Bi"
  # end

  # factory :user do
  #   (1...5).each do |u|
  #     u.sequence(:email) { |n| "mike#{n}@awesome.com"}
  #     u.password "password123"
  #     u.first_name "Yu#{u}"
  #     u.last_name "Song#{u}"
  #   end
  # end
end