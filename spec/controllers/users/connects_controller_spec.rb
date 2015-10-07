require 'rails_helper'

RSpec.describe Users::ConnectsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #approve" do
    it "returns http success" do
      get :approve
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #decline" do
    it "returns http success" do
      get :decline
      expect(response).to have_http_status(:success)
    end
  end

end
