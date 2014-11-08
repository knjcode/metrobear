FactoryGirl.define do
  factory :user do
    sequence(:provider) { "twitter" }
    sequence(:uid)  { |n| "#{n}" }
    sequence(:nickname) { |n| "person_#{n}"}
    sequence(:image_url) { "example.com" }
    sequence(:visiting_count) { 0 }
    sequence(:trophy_count) { 0 }
  end
end
