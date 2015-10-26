require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  # adjust attributes
  let(:valid_attributes) { attributes_for(:url) }
  let(:invalid_attributes) { attributes_for(:url, url: nil) }

  let(:url_with_valid_attributes) { create(:url, valid_attributes) }
  let(:url_with_invalid_attributes) { create(:url, valid_attributes) }

  let(:user) { sign_in create(:user) }

  subject { assigns(:url) }

  describe "POST #create" do
    it "creates a new url" do
      expect { post_action("url", valid_attributes) }.to change(Url, :count).by(1)
    end

    it "assigns a newly created url as @url" do
      post_action("url", valid_attributes)

      is_expected.to be_a(Url)
      is_expected.to be_persisted
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      before(:each) do
        put_action(url_with_valid_attributes, "url", valid_attributes)
      end

      it "updates the requested url" do
        url_with_valid_attributes.reload
      end

      it "assigns the requested url as @url" do
        is_expected.to eq(url_with_valid_attributes)
      end
    end

    context "with invalid params" do
      before(:each) do
        put_action(url_with_valid_attributes, "url", invalid_attributes)
      end

      it "assigns the url as @url" do
        is_expected.to eq(url_with_valid_attributes)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      url_with_valid_attributes
    end

    it "destroys the requested store" do
      expect { destroy_action(url_with_valid_attributes) }.to change(Url, :count).by(-1)
    end
  end
end
