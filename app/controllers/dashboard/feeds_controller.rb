class Dashboard::FeedsController < Dashboard::HomeController
  def index
    add_breadcrumb "Feeds"

    following_ids = current_user.following.map(&:id)
    @feeds        = Url.includes(:user).where(user_id: following_ids).order(created_at: :desc).page(params[:page]).per(21)
    @latest_url   = Url.order(created_at: :desc).limit(8)
  end
end
