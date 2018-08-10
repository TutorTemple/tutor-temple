require 'rails_helper'

RSpec.feature 'New subject', type: :feature do
  context 'create new user' do
    let(:user) { create(:admin) }

    before(:each) do
      sign_in(email: user.email, password: user.password)
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
      expect(page).to have_content('Subject was successfully created.')
    end

    scenario 'should be failure' do
      create(:subject, name: 'hui')
      click_link 'Subjects'
      expect(page).to have_content('New Subject')
      click_link 'New Subject'
      expect(page).to have_content('New Subject')
      within('form') do
        fill_in 'Name', with: 'hui'
      end
      click_on 'Create Subject'
      expect(page).to have_content('has already been taken')
    end
  end
end
