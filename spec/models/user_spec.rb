require 'rails_helper'
RSpec.describe User, type: :model do
  context 'Validation Tests for Users' do
    let(:user) { User.new(username: 'user_test') }
    let(:dup_user) { user.dup }

    it 'Should be valid if it has a username more than 3 chars' do
      expect(user).to be_valid
    end

    it 'Should not be valid if username have less than 3 chars' do
      user.username = 'SA'
      expect(user).not_to be_valid
    end

    it 'Should not be valid if user is empty' do
      user.username = ''
      expect(user).not_to be_valid
    end
  end

  context 'Assocs test for User/event' do
    it { should have_many(:event_attendees) }
    it { should have_many(:attending_events) }
    it { should have_many(:created_events) }
  end
end
