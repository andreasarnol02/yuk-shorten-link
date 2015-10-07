class Users::ConnectsController < ApplicationController
  before_action :set_user

  def index
  end

  def approve
    callback = session["devise.social_network_data"]
    @user.authentications.first_or_create(uid: callback["uid"], provider: callback["provider"])

    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  end

  private
    def set_user
      @user = User.find_by(email: session["devise.social_network_data"]["info"]["email"])
    end
end
