require 'rails_helper'
RSpec.describe 'Authentication features', type: :feature do
  let(:user) { User.create(username: 'Testing') }
  # rubocop:disable Layout/LineLength
  let(:event) { Event.create(title: 'Testing event', location: 'Testing_loc', description: 'des_test', date: '2020-06-16', creator_id: user.id) }
  # rubocop:enable Layout/LineLength
  scenario 'User can create an event if its logged in' do
    # Testing with signup path
    visit signup_path
    fill_in 'Username', with: 'testing'
    click_on 'Create Account'
    visit new_event_path
    expect(page).to have_current_path(new_event_path)
  end

  scenario 'User cant create an event if its logged in' do
    visit new_event_path
    expect(page).to have_current_path(login_path)
  end

  scenario 'A user cant attend an event if its not logged in ' do
    event.save
    visit events_path
    click_on event.title
    expect(page).not_to have_content('Attend')
    expect(page).not_to have_content('Cancel')
  end

  scenario 'A user can attend an event if its logged in' do
    event.save
    # Testing with login path
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
    visit events_path
    click_on event.title
    expect(page).to have_content('Attend')
  end
end
