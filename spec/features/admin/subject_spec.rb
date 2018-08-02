require 'rails_helper'

RSpec.feature 'New subject', type: :feature do
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
      click_link 'Subjects'
      expect(page).to have_content('New Subject')
      click_link 'New Subject'
      expect(page).to have_content('New Subject')
      within('form') do
        fill_in 'Name', with: 'Math'
      end
      click_on 'Create Subject'
    end
  end
end
