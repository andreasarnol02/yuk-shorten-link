module Ahoy
  class Event < ActiveRecord::Base
    self.table_name = "ahoy_events"

    belongs_to :visit
    belongs_to :user

    def self.track_url_self(url_ids)
      joins(:visit).where("ahoy_events.properties->>'url_id' in (?)", url_ids)      
    end
  end
end
