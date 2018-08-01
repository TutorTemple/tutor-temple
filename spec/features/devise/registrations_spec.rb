require 'rails_helper'

RSpec.feature 'Registrations', type: :feature do
  context 'configure_sign_up_params' do
    let(:user) { build(:student) }
    scenario 'should be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
        choose 'user_role_student'
        check 'user_terms'
        click_on 'Sign Up'
      end
      expect(page).to have_content('Dashboard')
    end

    scenario 'should be failure' do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
        choose 'user_role_student'
        click_on 'Sign Up'
      end
      expect(page).to have_content('Terms must be accepted')
    end
  end
end
