FactoryGirl.define do
  factory :page do
    sequence(:title) { |n| "Page #{n}" }
    sequence(:content) { |n| "Page #{n} content" }
  end
end
