require 'rails_helper'

RSpec.feature 'Registrations', type: :feature do
  context 'configure_sign_up_params' do
    let(:user) { build(:student) }

    scenario 'should be successful' do
      sign_up(email: user.email, password: user.password, terms: true)
      expect(page).to have_content('Dashboard')
    end

    scenario 'should be failure' do
      sign_up(email: user.email, password: user.password)
      expect(page).to have_content('Terms must be accepted')
    end
  end
end
