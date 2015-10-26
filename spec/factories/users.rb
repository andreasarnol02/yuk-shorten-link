FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "asdasdasd"
    password_confirmation "asdasdasd"
    name "John Doe"
    slug "john-doe"
    confirmed_at Time.now
  end
end
