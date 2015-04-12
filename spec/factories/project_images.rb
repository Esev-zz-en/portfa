FactoryGirl.define do
  factory :project_image do
    sequence(:url) { |n| "http://www.example.com/#{n}.jpg" }
    sequence(:title) { |n| "Image #{n}" }
  end
end
