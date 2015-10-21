class HomeController < ApplicationController
  def index
  	@url_count = Url.all.count
  end
end
