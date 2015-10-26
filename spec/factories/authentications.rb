FactoryGirl.define do
  factory :authentication do
    uid "123456789456123"
    provider "Facebook"
    user nil
  end
end
