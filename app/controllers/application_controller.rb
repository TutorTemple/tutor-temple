# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    dashboard_index_path
  end

  def authenticate_user!
    redirect_to new_user_session_path unless current_user
  end

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user&.admin?
  end
end
