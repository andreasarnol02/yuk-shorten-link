class Dashboard::StatisticsController < Dashboard::HomeController
  before_action :set_url_ids
  before_action :statistics, except: [:index, :clicks]


  def index
    @referrer     = Ahoy::Event.track_url_self(@url_ids).group(:referring_domain).count 
    @top_clikcs   = current_user.urls.page(params[:page]).limit(10)
    @total_clicks = current_user.urls.sum(:click_count)
  end

  def browser
  end

  def country
  end

  def os
  end

  def device_type
  end

  def clicks
    _result = []
    result  = Ahoy::Event.track_url_self(@url_ids).group_by_day(:time, format: "%d %B %Y").count

    if result.count < 7
      days_left = 7 - result.count
      today_or_yesterday = result.present? ? Date.yesterday : Date.today
      days = ((Date.today - days_left.days)..today_or_yesterday).map { |e| e.strftime("%d %B %Y") }.to_a

      days.each do |day|
        _result << ["#{day}", 0]
      end

      if result.present?
        result.each do |key, value|
          _result << [key, value]
        end
      end
    else
      _result = result
    end

    render json: _result
  end

  private
    def statistics
      result = Ahoy::Event.track_url_self(@url_ids).group(action_name.to_sym).count 

      render json: result
    end

    def set_url_ids
      @url_ids = current_user.urls.map{ |e| e.id.to_s }
    end
end
