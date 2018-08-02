class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_profile_completion

  def index; end
end
