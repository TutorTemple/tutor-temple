require 'rails_helper'

RSpec.feature 'New profile', type: :feature, js: true do
  context 'create new user' do
    let(:user) { build(:student) }
    let!(:subject) { create(:subject) }

    before(:each) do
      sign_up(email: user.email, password: user.password, terms: true)
    end

    scenario 'should be successful' do
      visit new_profile_path
      within('form.profile_form') do
        fill_in 'profile_first_name', with: 'Marko'
        fill_in 'profile_last_name', with: 'Polo'
        fill_in 'profile_phone_number', with: '122324'
        fill_in 'profile_birthday', with: '11/11/1990'
        choose 'profile_gender_male'
        find('#profile_languages').select('English')
        find('#profile_languages').select('German')
        find('#profile_time_zone').select('Central America')
        find('#profile_subject_ids').select(subject.name)
        attach_file('profile[avatar]', Rails.root + 'spec/files/avatar.png')
        click_link '+ Add Education'
        find("input[name*='degree']").set('Ph. D.')
        find("input[name*='institution']").set('CSTU')
        find("select[name*='year']").select('2013')
        click_on 'Save Profile'
      end
      expect(page).to have_content('Dashboard')
    end

    scenario 'should be failure' do
      visit new_profile_path
      within('form.profile_form') do
        fill_in 'profile_first_name', with: 'Marko'
        fill_in 'profile_last_name', with: ''
        fill_in 'profile_phone_number', with: '122324'
        fill_in 'profile_birthday', with: '11/11/2019'
        choose 'profile_gender_male'
        find('#profile_languages').select('English')
        find('#profile_languages').select('German')
        find('#profile_time_zone').select('Central America')
        find('#profile_subject_ids').select(subject.name)
        attach_file('profile[avatar]', Rails.root + 'spec/files/test.pdf')
        click_on 'Save Profile'
      end
      expect(page).to have_current_path(profile_path)
    end
  end
end
