class Dashboard::StatisticsController < Dashboard::HomeController
  before_action :statistics, except: :index

  def index
    url_ids = current_user.urls.map{ |e| e.id.to_s }

    @referrer = Ahoy::Event.joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).group(:referrer).count 
  end

  def browser
  end

  def country
  end

  def os
  end

  def device_type
  end

  private
    def statistics
      url_ids = current_user.urls.map{ |e| e.id.to_s }
      result = Ahoy::Event.joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).group(action_name.to_sym).count 

      render json: result
    end
end
