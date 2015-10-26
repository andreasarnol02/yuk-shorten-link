require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # adjust attributes
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { attributes_for(:user, name: nil) }

  let(:user_with_valid_attributes) { create(:user, valid_attributes) }
  let(:user_with_invalid_attributes) { create(:user, valid_attributes) }

  let(:user) { sign_in create(:user) }

  subject { assigns(:user) }

  describe "GET #index" do
    it "should return a collection of users limit by 24 user in each page" do
      get :index, {}

      expect { assigns(:users).to eq([user_with_valid_attributes].first(24)) }
    end
  end

  describe "GET #show" do
    before :each do
      get :show, { id: user_with_valid_attributes.to_param }
      @urls = create(:url, user_id: user_with_valid_attributes.id)
    end

    it "should return links created by user" do
      expect { assigns(:links_created).to eq([@urls].first(16))  }
    end

    it "should return links count by user" do
      expect { assigns(:links_count).to eq(@urls.count) }
    end

    it "should return links clicked by user" do
      expect { assigns(:links_clicked).to eq(@urls.pluck(:click_count).inject { |sum, x| sum + x }) }
    end

    it "should return followers count by user" do
      expect { assigns(:followers_count).to eq(@urls.followers.count) }
    end
  end
end
