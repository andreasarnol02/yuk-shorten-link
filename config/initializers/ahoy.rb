class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
  Ahoy.track_visits_immediately = true
  # Ahoy.geocode = false

  def track_event(name, properties, options)
    super do |event|
      event.referrer_domain = URI(request.referrer).host rescue "Unknown source"
    end
  end
end
