class EventAttendee < ApplicationRecord
    belongs_to :attendee_event , class_name:"Event"
    belongs_to :event_attendee, class_name: "User"
end
