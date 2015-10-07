class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.from_omniauth(request.env["omniauth.auth"])

    auth_connect(user, "facebook")
  end

  def google
  end

  private
    def auth_connect(user, provider)
      if user.persisted?
        sign_in_and_redirect user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => provider) if is_navigational_format?
      else
        session["devise.social_network_data"] = request.env["omniauth.auth"]
        redirect_to users_connects_url
      end
    end
end
