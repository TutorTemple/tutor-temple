class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose :profile, (-> { current_user.profile })
end
