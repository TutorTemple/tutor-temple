require 'rails_helper'

RSpec.feature 'Account settings', type: :feature, js: true do
  let(:user) { create(:profile).user }
  let(:valid_attributes) do
    {
      email: 'updated@example.com',
      password: 'password',
      password_confirmation: 'password',
      current_password: user.password
    }
  end

  before do
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log In'
    end
    visit settings_path(anchor: :account)
  end

  scenario 'updating account settings' do
    update_settings_with(valid_attributes.merge(current_password: 'invalid'))
    assert_current_password_required
    update_settings_with(valid_attributes.merge(email: 'invalid'))
    assert_email_invalid
    update_settings_with(valid_attributes.merge(password: 'short'))
    assert_password_invalid
    update_settings_with(valid_attributes.merge(password_confirmation: 'invalid'))
    assert_password_does_not_match
    update_settings_with(valid_attributes)
    assert_settings_updated
  end

  def update_settings_with(attributes)
    within '#account form' do
      attributes.each do |attribute_name, value|
        fill_in "user_#{attribute_name}", with: value
      end
      click_on 'Update'
      sleep 0.4 # FIXME find workaround to not use #sleep in specs
    end
  end

  def assert_current_password_required
    expect(page).to have_content('Current password is invalid')
  end

  def assert_email_invalid
    expect(page).to have_content('Email is invalid')
    expect { user.reload }.not_to change(user, :email)
  end

  def assert_password_invalid
    expect(page).to have_content('Password is too short')
  end

  def assert_password_does_not_match
    expect(page).to have_content("Password confirmation doesn't match")
  end

  def assert_settings_updated
    expect { user.reload }.to change(user, :encrypted_password)
    expect(user.email).to eq(valid_attributes[:email])
  end
end
