require 'rails_helper'
RSpec.describe Event, type: :model do
  context 'Validation for Event model'
  let(:user) { User.create(username: 'Testing') }
  # rubocop:disable Layout/LineLength
  let(:event) { Event.new(title: 'Testing event', location: 'Testing_loc', description: 'des_test', date: '2020-06-16', creator_id: user.id) }
  # rubocop:enable Layout/LineLength
  it 'Event should be valid if it has a title' do
    expect(event).to be_valid
  end

  it 'Event shouldnt be valid if does not have a title' do
    event.title = ''
    expect(event).not_to be_valid
  end

  context 'Assocs test for event/user models' do
    it { should have_many(:attendees) }
    it { should have_many(:event_attendees) }
    it { should belong_to(:creator) }
  end
end
