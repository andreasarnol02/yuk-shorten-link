class Dashboard::StatisticsController < Dashboard::HomeController
  def index
    @referrer = Ahoy::Event.joins(:visit).where(user_id: current_user.id).group(:referrer).count
  end

  def browser
    render json: Ahoy::Event.joins(:visit).where(user_id: current_user.id).group(:browser).count
  end

  def country
    render json: Ahoy::Event.joins(:visit).where(user_id: current_user.id).group(:country).count
  end

  def os
    render json: Ahoy::Event.joins(:visit).where(user_id: current_user.id).group(:os).count
  end

  def device_type
    render json: Ahoy::Event.joins(:visit).where(user_id: current_user.id).group(:device_type).count
  end
end
