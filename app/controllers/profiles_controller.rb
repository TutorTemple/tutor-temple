class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose :profile, (-> { current_user.profile })

  def create
    @profile = Profile.new(profile_params.merge(user_id: current_user.id))
    @profile.save
    redirect_to dashboard_index_path
  end

  def update
    Profile.update(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :gender, :birthday, :phone_number, :about_me, :avatar)
  end
end
