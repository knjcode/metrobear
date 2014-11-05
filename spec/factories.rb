FactoryGirl.define do
  factory :user do
    sequence(:provider) { "twitter" }
    sequence(:uid)  { |n| "#{n}" }
    sequence(:nickname) { |n| "person_#{n}"}
    sequence(:image_url) { "example.com" }
    #password "foobar"
    #password_confirmation "foobar"

    # factory :admin do
    #   admin true
    # end
  end
end
