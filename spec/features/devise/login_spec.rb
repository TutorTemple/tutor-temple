require 'rails_helper'

RSpec.feature 'New session', type: :feature do
  context 'configure_sign_in_params' do
    let(:user) { create(:student) }

    scenario 'should be successful' do
      sign_in(email: user.email, password: user.password)
      expect(page).to have_content('Dashboard')
    end

    scenario 'should be failure' do
      attempt_sign_in(email: user.email, password: '1111111')
      expect(page).to have_content('Forgot your password?')
    end
  end
end
