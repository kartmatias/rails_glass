FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123@" }
    #reset_password_token { Hash[*Faker::Lorem.words(4)] }
    encrypted_password { Hash[*Faker::Lorem.words(8)] }
  end
end