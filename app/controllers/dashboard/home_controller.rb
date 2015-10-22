class Dashboard::HomeController < ApplicationController
  layout 'dashboard_users'

  before_action :authenticate_user!

  add_breadcrumb "Dashboard", :dashboard_url

  def index
    add_breadcrumb "Home"

    url_ids        = current_user.urls.map{ |e| e.id.to_s }
    ahoy_track     = Ahoy::Event.track_url_self(url_ids, false).where(time: Date.today..Time.now)
    today_clicks   = Url.where(id: ahoy_track.map { |e| e.properties["url_id"] })

    @today_clicks_count = ahoy_track.count
    @top_10_today       = today_clicks.order(click_count: :desc).limit(10)
    @today_clicks       = today_clicks.order(created_at: :desc).page(params[:page]).per(10)
  end
end
