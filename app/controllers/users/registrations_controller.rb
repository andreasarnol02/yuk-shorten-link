class Users::RegistrationsController < Devise::RegistrationsController
  layout :layout_login

  private
	  def layout_login
	  	if action_name.eql?("edit") || action_name.eql?("update")
	  		"dashboard_users"
	  	else
	  		"application"
	  	end
	  end
end
