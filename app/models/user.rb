class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :profile, dependent: :destroy
  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  enum role: { student: 0, tutor: 1, admin: 2 }.freeze

  delegate :first_name, :last_name, :gender, :birthday, :avatar, to: :profile

  validates_presence_of :role
  validates_acceptance_of :terms
  attr_accessor :terms

  class << self
    def create_from_omniauth(auth_params, user_params)
      # binding.pry
      attributes = {
        email: auth_params['info']['email'],
        password: Devise.friendly_token[0, 20],
        role: user_params['role'],
        # profile_attributes: {
        #   first_name: auth_params['info']['first_name'],
        #   last_name: auth_params['info']['last_name'],
        #   remote_avatar_url: auth_params['info']['image']
        # }
      }
      create(attributes)
    end
  end
end
