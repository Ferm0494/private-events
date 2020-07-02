require 'rails_helper'
RSpec.describe 'Creating event ', type: :feature do
  scenario 'Valid event creation' do
    visit signup_path
    fill_in 'Username', with: 'testing'
    click_on 'Create Account'
    visit new_event_path
    fill_in 'Title', with: 'testing-event'
    fill_in 'Location', with: 'testing-event'
    fill_in 'Description', with: 'testing-event'
    fill_in 'Date', with: '2020-06-16 00:00:00'
    click_on 'Create event'
    expect(page).to have_current_path(root_path)
  end

  scenario 'Invalid event creation' do
    visit signup_path
    fill_in 'Username', with: 'testing'
    click_on 'Create Account'
    visit new_event_path
    fill_in 'Title', with: ''
    fill_in 'Location', with: 'testing-event'
    fill_in 'Description', with: 'testing-event'
    fill_in 'Date', with: '2020-06-16 00:00:00'
    click_on 'Create event'
    expect(page).to have_current_path(new_event_path)
  end
end
