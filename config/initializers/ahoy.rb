class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
  Ahoy.track_visits_immediately = true
  # Ahoy.geocode = false
end
