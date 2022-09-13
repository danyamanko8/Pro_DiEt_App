FactoryBot.define do
  factory :user do
    email_address { Faker::Internet.email }
    password { '123456' }
  end
end
