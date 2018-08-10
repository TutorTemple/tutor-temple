require 'rails_helper'

RSpec.feature 'Registrations', type: :feature do
  describe 'sign up' do
    %i[tutor student].each do |role|
      context "as a #{role}" do
        context 'with valid attributes' do
          let(:new_user_attributes) { attributes_for(role).slice(:password, :email, :role).merge(terms: true) }

          scenario do
            sign_up(**new_user_attributes)
            expect(page).to have_content('Dashboard')
            expect(User.where(email: new_user_attributes[:email], role: role)).to exist
          end
        end

        context 'without terms checked' do
          let(:new_user_attributes) { attributes_for(role).slice(:password, :email, :role) }

          scenario do
            sign_up(**new_user_attributes)
            expect(page).to have_content('Terms must be accepted')
            expect(User.where(email: new_user_attributes[:email], role: role)).not_to exist
          end
        end
      end
    end
  end
end
