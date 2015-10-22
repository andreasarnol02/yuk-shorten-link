class Dashboard::UrlsController < Dashboard::HomeController
  def my_links
    add_breadcrumb "My Links"

    @my_links = current_user.urls.page(params[:page]).per(12)
  end
end
