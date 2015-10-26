require 'rails_helper'

RSpec.describe Dashboard::FeedsController, type: :controller do
  let(:created_user) { create(:user) }

  # adjust attributes
  let(:valid_attributes) { attributes_for(:url, user_id: created_user.id) }
  let(:invalid_attributes) { attributes_for(:url, url: nil) }

  let(:url_with_valid_attributes) { create(:url, valid_attributes) }
  let(:url_with_invalid_attributes) { create(:url, valid_attributes) }

  let(:user) { sign_in created_user }

  subject { assigns(:url) }

  describe "GET #index" do
    before :each do
      get :index, {}, user
    end

    it "returns latest url shortened" do
      expect { assigns(:latest_url).to eq([url_with_valid_attributes].last(8)) }
    end
  end

end
