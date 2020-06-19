class User < ApplicationRecord
  has_many :event_attendees, foreign_key: :event_attendee_id
  has_many :attending_events, through: :event_attendees, source: :attendee_event
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  validates :username, uniqueness: true, length: { minimum: 3 }
end
