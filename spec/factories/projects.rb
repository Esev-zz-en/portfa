FactoryGirl.define do
  factory :project do
    sequence(:title) { |n| "Project #{n}" }
    sequence(:content) { |n| "Project #{n} content" }
  end
end
