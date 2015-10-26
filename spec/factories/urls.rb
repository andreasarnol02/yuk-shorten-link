FactoryGirl.define do
  factory :url do
    url "https://www.google.com"
    shorten "asd123"
    type "default"
    user nil
  end
end
