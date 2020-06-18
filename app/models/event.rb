class Event < ApplicationRecord
    has_many :event_attendees, foreign_key: :attendee_event_id
    has_many :attendees, through: :event_attendees, source: :event_attendee
    scope :expired_events, -> (date=Date.today){where("date < ?",date).order(date: :asc)}
    scope :recent_events, -> (date=Date.today){where("date > ?",date).order(date: :asc)}
    validates :title, presence: true
    belongs_to :creator, class_name: "User"
end
