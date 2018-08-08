class SearchesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_profile_completion

  expose :profiles, -> { Profile.all.search_profiles(params[:search_query]) }

  def index; end
end
