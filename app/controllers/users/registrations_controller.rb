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

  private
  	def breadcrumb
	  	add_breadcrumb "Dashboard", :dashboard_url
	  	add_breadcrumb "Edit Profile", :edit_user_registration_url
  	end

    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end
end
