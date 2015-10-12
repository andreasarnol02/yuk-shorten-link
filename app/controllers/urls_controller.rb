class UrlsController < ApplicationController
  def new
  end

  def create
    @url = 
    	current_user.present? ? current_user.urls.new(url_params) : Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.json { render json: @url, status: :created }
      else
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def routing_error
    redirect_shorten_url
  end

  private
    def url_params
      params.require(:url).permit(:url, :shorten, :type_url)
    end
end
