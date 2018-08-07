class SearchesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_profile_completion

  def index
    @profiles = if params[:search_query]
                  Profile.search_profiles(params[:search_query])
                else
                  Profile.all
                end
  end
end
