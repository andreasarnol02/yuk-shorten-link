class Users::RegistrationsController < Devise::RegistrationsController
  include Layoutable

  private
    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end
end
