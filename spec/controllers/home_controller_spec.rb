require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  # adjust attributes
  let(:valid_attributes) { attributes_for(:url) }
  let(:invalid_attributes) { attributes_for(:url, url: nil) }

  let(:url_with_valid_attributes) { create(:url, valid_attributes) }
  let(:url_with_invalid_attributes) { create(:url, valid_attributes) }

  let(:user) { sign_in create(:user) }

  subject { assigns(:url) }

  describe "GET #index" do
    it "return all url count" do
      get :index, {}
      expect { assigns(:url_count).to eq(Url.count) }
    end
  end
end
