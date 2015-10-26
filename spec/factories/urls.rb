FactoryGirl.define do
  factory :url do
    url "https://www.google.com"
    shorten "asd123"
    type_url "default"
    user nil
  end
end
