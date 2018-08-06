# frozen_string_literal:true

class AuthenticationService < BaseService
  def self.create(args)
    new(args).create
  end

  def create
    if authentication
      authentication.user
    elsif user
      create_authentication(auth_params, user, provider).user
    else
      create_authentication(auth_params, create_user(auth_params), provider).user
    end
  end

  private

  def provider
    @provider ||= AuthenticationProvider.find_by(name: auth_params['provider'])
  end

  def authentication
    @authentication ||= provider.user_authentications.find_by(uid: auth_params['uid'])
  end

  def user
    @user ||= current_user || User.find_by(email: auth_params['info']['email'])
  end

  def create_authentication(auth_params, user, provider)
    UserAuthentication.create_from_omniauth(auth_params, user, provider)
  end

  def create_user(auth_params)
    User.create_from_omniauth(auth_params, user_params)
  end
end
