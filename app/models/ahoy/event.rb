module Ahoy
  class Event < ActiveRecord::Base
    self.table_name = "ahoy_events"

    belongs_to :visit
    belongs_to :user

    def self.track_url_self(url_ids, time)
      visit = joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids)

      case time
      when "Past 24 Hours"
        visit.where(time: (Time.now - 1.day)..Time.now)
      when "Past 7 Days"
        visit.where(time: (Time.now - 7.days)..Time.now)
      when "Past 14 Days"
        visit.where(time: (Time.now - 14.days)..Time.now)
      when "Past 30 Days"
        visit.where(time: (Time.now - 30.days)..Time.now)
      when "Past 3 Months"
        visit.where(time: (Time.now - 3.months)..Time.now)
      when "Past 1 Year"
        visit.where(time: (Time.now - 1.year)..Time.now)
      else
        visit      
      end
    end
  end
end
