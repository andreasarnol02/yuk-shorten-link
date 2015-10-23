class Users::RegistrationsController < Devise::RegistrationsController
  include Layoutable

  def edit
  	breadcrumb
  	
  	super
  end

  def update
		breadcrumb

  	super
  end

  protected
    def update_resource(resource, params)
      if resource.authentications.present?
        resource.update_without_password(params)
      else
        super
      end
    end

  private
  	def breadcrumb
	  	add_breadcrumb "Dashboard", :dashboard_url
	  	add_breadcrumb "Edit Profile", :edit_user_registration_url
  	end

    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end

    def after_update_path_for(resource)
      edit_user_registration_path
    end
end
