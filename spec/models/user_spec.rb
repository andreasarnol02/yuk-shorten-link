require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:authentications) }
    it { is_expected.to have_many(:urls) }
    it { is_expected.to have_many(:visits) }
    it { is_expected.to have_many(:active_relationships) }
    it { is_expected.to have_many(:passive_relationships) }
    it { is_expected.to have_many(:following).through(:active_relationships) }
    it { is_expected.to have_many(:followers).through(:passive_relationships) }
  end
end
