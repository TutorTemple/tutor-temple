# frozen_string_literal:true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def create_and_sign_in
    user = AuthenticationService.create(auth_params: auth_params, current_user: current_user, user_params: user_params)
    if user.valid?
      sign_in_and_redirect user
    else
      flash[:error] = user.errors.full_messages.first
      redirect_to new_user_registration_path
    end
  end

  alias facebook create_and_sign_in
  alias google_oauth2 create_and_sign_in

  private

  def auth_params
    request.env['omniauth.auth']
  end

  def user_params
    request.env['omniauth.params']
  end
end
