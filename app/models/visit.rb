class Visit < ActiveRecord::Base
  has_many :ahoy_events, class_name: "Ahoy::Event", dependent: :destroy
  belongs_to :user
end
