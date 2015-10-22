class Users::ConnectsController < ApplicationController
  layout 'authentication'

  before_action :set_user, except: :unconnect

  def index
  end

  def approve
    callback = session["devise.social_network_data"]
    @user.connect_account(callback["uid"], callback["provider"])

    sign_in @user
    redirect_to dashboard_path
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
