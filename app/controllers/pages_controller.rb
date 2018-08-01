class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  expose :profile, (-> { current_user.profile })

  def index; end
end
