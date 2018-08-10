module AuthHelper
  def sign_in(args)
    visit user_session_path
    within('form#new_user') do
      fill_in 'Email', with: args[:email]
      fill_in 'Password', with: args[:password]
    end
    click_on 'Log In'
  end

  def sign_up(args)
    visit new_user_registration_path
    within('form#new_user') do
      fill_in 'Email', with: args[:email]
      fill_in 'user_password', with: args[:password]
      fill_in 'user_password_confirmation', with: args[:password]
      find('label', text: 'Student').click
      check 'user_terms' if args[:terms]
      click_on 'Sign Up'
    end
  end
end