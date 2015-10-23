class UrlsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :destroy]
  before_action :set_url, only: [:update, :destroy]

  def new
  end

  def create
    @url = current_user.present? ? current_user.urls.new(url_params) : Url.new(url_params)
    @url.ip = request.ip
    
    respond_to do |format|
      if @url.save
        format.js
      else
        format.js
      end
    end 
  end

  def update
    respond_to do |format|
      if @url.update(url_params)
        format.js
      else
        format.js
      end
    end 
  end

  def destroy
    @url.destroy
  end

  def routing_error
    redirect_shorten_url
  end

  private
    def set_url
      @url = Url.find(params[:id])
    end

    def url_params
      params.require(:url).permit(:url, :shorten, :type_url)
    end
end
