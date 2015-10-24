class UsersController < ApplicationController
  layout 'dashboard_users'

  before_action :set_following_ids
  before_action :set_user, only: :show

  add_breadcrumb "Users", :users_url

  def index
    @users = User.all.page(params[:page]).per(24)
  end

  def show
    add_breadcrumb params[:id]

    links_created    = @user.urls
    
    @links_created   = links_created.page(params[:page]).per(30)
    @links_count     = links_created.count
    @links_clicked   = links_created.pluck(:click_count).inject { |sum, x| sum + x }
    @followers_count = @user.followers.count
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_following_ids
      @following_ids = current_user.present? ? current_user.following.map(&:id) : Array.new
    end
end
