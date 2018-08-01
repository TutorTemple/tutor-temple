class DashboardController < ApplicationController
  expose :profile, (-> { current_user.profile })

  def index; end
end
