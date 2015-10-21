class Users::ConnectsController < ApplicationController
  before_action :set_user, except: :unconnect

  def index
  end

  def approve
    callback = session["devise.social_network_data"]
    @user.connect_account(callback["uid"], callback["provider"])

    sign_in_and_redirect dashboard_path, :event => :authentication #this will throw if @user is not activated
  end

  def unconnect
    current_user.already_connected(params[:provider]).first.destroy
    redirect_to :back
  end

  private
    def set_user
      @user = User.find_by(email: session["devise.social_network_data"]["info"]["email"])
    end
end
