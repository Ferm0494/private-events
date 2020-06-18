class EventAttendee < ApplicationRecord
    belongs_to :attendee_event , class:"Event"
    belongs_to :event_attendee, class: "User"
end
