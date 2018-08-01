require 'rails_helper'

RSpec.feature 'User Features', type: :feature do
  context 'create new user' do
    let(:user) { create(:admin) }

    before(:each) do
      visit '/users/sign_in'
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_on 'Log in'
      visit '/admin'
      expect(page).to have_content('Dashboard')
    end

    scenario 'should be successful' do
      click_link 'Users'
      expect(page).to have_content(user.email)
      within "tr#user_#{user.id}" do
        click_link 'Edit'
      end
      expect(page).to have_content('Edit User')
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
      end
      click_on 'Update User'
    end
  end
end
