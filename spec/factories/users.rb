FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "asdasdasd"
    password_confirmation "asdasdasd"
    name "John Doe"
    slug "john-doe"
  end
end
