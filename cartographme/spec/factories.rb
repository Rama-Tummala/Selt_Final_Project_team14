FactoryGirl.define do
  sequence(:name)  { |n| "Person #{n}" }
  sequence(:email) { |n| "person_#{n}@example.com"}
  factory :user do
    email "suman.474@gmail.com"
    name "sumank"
    password "sumank"
    password_confirmation "sumank"

  end

end