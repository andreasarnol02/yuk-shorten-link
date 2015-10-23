class Users::RelationshipsController < ApplicationController
	before_action :set_user

	def create
		@follow = current_user.follow(@user)
	end

	def destroy
		@unfollow = current_user.unfollow(@user)
	end

	private
		def set_user
			@user = User.find(params[:id])
		end
end
