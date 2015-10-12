class Dashboard::HomeController < ApplicationController
  layout 'dashboard_users'

  before_action :authenticate_user!

  def index

  end
end
