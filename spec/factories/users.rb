FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password {BCrypt::Password.create("123456")}
  end
end