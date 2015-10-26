require 'rails_helper'

RSpec.describe Dashboard::UrlsController, type: :controller do
  let(:created_user) { create(:user) }

  # adjust attributes
  let(:valid_attributes) { attributes_for(:url, user_id: created_user.id) }
  let(:invalid_attributes) { attributes_for(:url, url: nil) }

  let(:url_with_valid_attributes) { create(:url, valid_attributes) }
  let(:url_with_invalid_attributes) { create(:url, valid_attributes) }

  let(:user) { sign_in created_user }

  subject { assigns(:url) }

  describe "GET #my_links" do
    it "returns my links users" do
      get :my_links, {}, user

      expect { assigns(:my_links).to eq([url_with_valid_attributes].first(12)) }
    end
  end

end
