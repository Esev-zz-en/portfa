FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:name) { |n| "User #{n}" }
    password '12345678'
  end
end
