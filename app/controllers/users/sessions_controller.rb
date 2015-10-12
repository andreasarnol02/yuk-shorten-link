class Users::SessionsController < Devise::SessionsController

  protected
    def after_sign_in_path_for(resource)
      if resource.has_role? :admin
        admin_path
      else
        stored_location_for(resource) || dashboard_path
      end
    end
end
