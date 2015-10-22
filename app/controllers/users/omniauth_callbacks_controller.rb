class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.from_omniauth(request.env["omniauth.auth"])

    auth_connect(user, "facebook", request.env["omniauth.auth"])
  end

  def google_oauth2
    user = User.from_omniauth(request.env["omniauth.auth"])

    auth_connect(user, "google", request.env["omniauth.auth"])
  end

  private
    def auth_connect(user, provider, callbacks)
      if current_user.present?
        current_user.connect_account(callbacks["uid"], callbacks["provider"])
        redirect_to edit_user_registration_url
      else
        if user.persisted?
          sign_in user, :event => :authentication #this will throw if @user is not activated
          redirect_to dashboard_path
          set_flash_message(:notice, :success, :kind => provider) if is_navigational_format?
        else
          session["devise.social_network_data"] = callbacks
          redirect_to users_connects_url
        end
      end
    end
end
