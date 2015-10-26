class HomeController < ApplicationController
  def index
  	@url_count = Url.count
  end
end
