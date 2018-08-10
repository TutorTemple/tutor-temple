module AuthHelper
  def sign_in(email:, password:)
    attempt_sign_in(email: email, password: password)
    assert_signed_in
  end

  def attempt_sign_in(email:, password:)
    visit user_session_path
    within('form#new_user') do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      first('input[type="submit"]').click
    end
  end

  def sign_up(email:, password:, role: :student, terms: false)
    visit new_user_registration_path
    within('form#new_user') do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      find('label', text: role.to_s.humanize).click
      check 'user_terms' if terms
      first('input[type="submit"]').click
    end
  end

  def assert_signed_in
    expect(page).to have_css('body.signed-in')
  end
end

RSpec.configure do |config|
  config.include AuthHelper, type: :feature
end
