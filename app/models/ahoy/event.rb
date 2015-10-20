module Ahoy
  class Event < ActiveRecord::Base
    self.table_name = "ahoy_events"

    belongs_to :visit
    belongs_to :user

    def self.track_url_self(url_ids, time)
      case time
      when "Past 24 Hours"
        joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).where(time: (Time.now - 1.day)..Time.now)
      when "Past 7 Days"
        joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).where(time: (Time.now - 7.days)..Time.now)
      when "Past 14 Days"
        joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).where(time: (Time.now - 14.days)..Time.now)
      when "Past 30 Days"
        joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).where(time: (Time.now - 30.days)..Time.now)
      when "Past 3 Months"
        joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).where(time: (Time.now - 3.months)..Time.now)
      when "Past 1 Year"
        joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids).where(time: (Time.now - 1.year)..Time.now)
      else
        joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids)      
      end
    end
  end
end
