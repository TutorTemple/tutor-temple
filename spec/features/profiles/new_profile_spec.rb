require 'rails_helper'

RSpec.feature 'New profile', type: :feature do
  context 'create new user' do
    let(:user) { build(:student) }

    before(:each) do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
        choose 'user_role_student'
        check 'user_terms'
        click_on 'Sign Up'
      end
    end

    scenario 'should be successful' do
      visit new_profile_path
      within('form') do
        fill_in 'profile_first_name', with: 'Marko'
        fill_in 'profile_last_name', with: 'Polo'
        fill_in 'profile_phone_number', with: '122324'
        fill_in 'profile_birthday', with: '11/11/1990'
        choose 'profile_gender_male'
        click_on 'Submit'
      end
      expect(page).to have_content('Dashboard')
    end

    scenario 'should be failure' do
      visit new_profile_path
      within('form') do
        fill_in 'profile_first_name', with: 'Marko'
        fill_in 'profile_last_name', with: ''
        fill_in 'profile_phone_number', with: '122324'
        fill_in 'profile_birthday', with: '11/11/2019'
        choose 'profile_gender_male'
        click_on 'Submit'
      end
      expect(page).to have_current_path(profile_path)
    end
  end
end