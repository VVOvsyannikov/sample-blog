require 'rails_helper'

feature 'Logging in' do
  before(:each) do
    sign_up
  end

  scenario 'User logging in' do
    click_button 'Sign Out'
    visit new_user_session_path

    expect(page).to have_content 'Log in'

    fill_in :user_email, with: 'user@example.com'
    fill_in :user_password, with: 'secure123!@#'
    click_button 'Log in'

    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end
end
