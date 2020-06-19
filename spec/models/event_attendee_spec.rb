require 'rails_helper'
RSpec.describe EventAttendee, type: :model do
  context 'Assocs test for Attendee_event many/many' do
    it { should belong_to(:attendee_event) }
    it { should belong_to(:event_attendee) }
  end
end
