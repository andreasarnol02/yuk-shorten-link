class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # http_basic_authenticate_with name: "sl", password: "abcada5", if: :is_production?

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_url

  rescue_from "ActionController::ActiveRecord::RecordNotFound", with: :redirect_shorten_url

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
    end  

  private
    def redirect_shorten_url
      shorten = request.path.gsub("/", "")
      url = Url.find_by(shorten: shorten)
      if url.present?
        ahoy.track_visit
        ahoy.track "Track Click", { url_id: url.id }
        url.update(click_count: url.click_count + 1)
        redirect_to url.url
      else
        respond_to do |format|
          format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
          format.xml  { head :not_found }
          format.any  { head :not_found }
        end
      end
    end

    def set_url
      @url = Url.new
    end

    def is_production?
      Rails.env.production?
    end
end
