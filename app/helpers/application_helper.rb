module ApplicationHelper
	def connect(provider)
		if current_user.already_connected(provider).present?
			link_to "UnConnect", unconnect_users_connects_path(provider: provider), class: "btn btn-danger", method: :delete
		else
			link_to "Connect", user_omniauth_authorize_path(provider), class: "btn btn-primary"
		end
	end
end
