FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:name) { |n| "User #{n}" }
    sequence(:username) { |n| "user#{n}" }
    password '12345678'
  end
end
