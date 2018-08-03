class UserAuthentication < ApplicationRecord
  belongs_to :user
  belongs_to :authentication_provider

  belongs_to :user
  belongs_to :authentication_provider

  def self.create_from_omniauth(auth_params, user, provider)
    create(
      user: user,
      authentication_provider: provider,
      uid: auth_params['uid'],
      token: auth_params['credentials']['token'],
      token_expires_at: get_token_expiration_time(auth_params)
    )
  end

  class << self
    private

    def get_token_expiration_time(auth_params)
      auth_params['credentials']['expires_at'] && Time.at(auth_params['credentials']['expires_at']).to_datetime
    end
  end
end
