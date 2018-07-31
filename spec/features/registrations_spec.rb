require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  context "configure_sign_up_params" do
    scenario "should be successful" do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: '123321@gmail.com'
        fill_in 'user_password', with: '123123'
        fill_in 'user_password_confirmation', with: '123123'
      end
    end

    scenario "should be failure" do

    end

  end

  context "configure_sign_in_params" do

  end
end
