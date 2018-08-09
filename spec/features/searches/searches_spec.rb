require 'rails_helper'

RSpec.feature 'Search', type: :feature do
  context 'search for profiles' do
    let!(:profile) { create(:profile, :with_subject) }
    let!(:other_profile) { create(:profile, :with_subject) }

    before(:each) do
      visit search_path
    end

    scenario 'should find first profile' do
      within('.container-fluid:nth-child(2) form') do
        fill_in 'search_query', with: profile.first_name
        click_on 'Search'
      end
      expect(page).to have_content(profile.full_name)
      expect(page).to_not have_content(other_profile.full_name)
    end

    scenario 'should find second profile' do
      within('.container-fluid:nth-child(2) form') do
        fill_in 'search_query', with: other_profile.subjects.first.name
        click_on 'Search'
      end
      expect(page).to have_content(other_profile.full_name)
      expect(page).to_not have_content(profile.full_name)
    end
  end
end
