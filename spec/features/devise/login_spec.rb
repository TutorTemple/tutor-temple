require 'rails_helper'

RSpec.feature 'New session', type: :feature do
  context 'configure_sign_in_params' do
    let(:user) { create(:student) }
    scenario 'should be successful' do
      visit user_session_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'user_password', with: user.password
        click_on 'Log in'
      end
      expect(page).to have_content('Dashboard')
    end

    scenario 'should be failure' do
      visit user_session_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'user_password', with: '1111111'
        click_on 'Log in'
      end
      expect(page).to have_content('Forgot your password?')
    end
  end
end
