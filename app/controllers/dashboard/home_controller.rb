class Dashboard::HomeController < ApplicationController
  layout 'dashboard_users'

  before_action :authenticate_user!

  add_breadcrumb "Dashboard", :dashboard_url

  def index
  	add_breadcrumb "Home"
  end
end
