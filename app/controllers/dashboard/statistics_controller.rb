class Dashboard::StatisticsController < Dashboard::HomeController
  before_action :set_url_ids
  before_action :statistics, except: [:index, :clicks]

  def index
    properties   = Ahoy::Event.track_url_self(@url_ids, @time).group(:properties).count
    url_ids      = properties.map { |key, value| key.map { |key,value| value } }.flatten

    @referrer     = Ahoy::Event.track_url_self(@url_ids, @time).group(:referrer_domain).count 
    @top_clicks   = Url.where(id: url_ids).order(click_count: :desc).page(params[:page]).limit(5)
    @total_clicks = properties.map { |key, value| value }.inject { |sum, x| sum + x }
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
    result  = Ahoy::Event.track_url_self(@url_ids, @time).group_by_day(:time, format: "%d %B %Y").count

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
      result = Ahoy::Event.track_url_self(@url_ids, @time).group(action_name.to_sym).count 

      render json: result
    end

    def set_url_ids
      @url_ids = current_user.urls.map{ |e| e.id.to_s }
      @time    = params[:stat][:time] rescue false
    end
end
