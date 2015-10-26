require 'rails_helper'

RSpec.describe Url, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:shorten).on(:update) }
    it { is_expected.to allow_value("http://google.com", "https://google.com").for(:url) }   
    it { is_expected.to allow_value("asd123").for(:shorten).on(:update) }   
    # it { is_expected.to allow_value("asd123").for(:shorten).on(:create).if(:custom) }   
    # it { is_expected.to validate_presence_of(:shorten).on(:create).if(:custom) }
  end
end
