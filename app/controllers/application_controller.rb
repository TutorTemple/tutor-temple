# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :check_profile_completion

  expose :current_profile, (-> { current_user&.profile })

  private

  def check_profile_completion
    redirect_to new_profile_path unless current_profile&.valid? || devise_controller?
  end

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user&.admin?
  end
end
