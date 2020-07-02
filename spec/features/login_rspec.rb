require 'rails_helper'
RSpec.describe 'Login', type: :feature do
  scenario 'Valid login' do
    user = User.create(username: 'testing')
    visit login_path
    fill_in 'username', with: user.username
    click_on 'Log in'
    expect(page).to have_content('testing')
  end

  scenario 'Invalid login' do
    visit login_path
    fill_in 'username', with: 'testing2'
    click_on 'Log in'
    expect(page).to have_content('Log in')
  end
end
