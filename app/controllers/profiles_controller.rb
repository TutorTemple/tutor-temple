class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose :profile, (-> { Profile.find_or_initialize_by(user_id: current_user.id) })

  def create
    profile = Profile.new(profile_params)
    if profile.save
      redirect_to dashboard_index_path
    else
      render :new
    end
  end

  def update
    if profile.update(profile_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :first_name, :last_name, :gender, :birthday, :phone_number, :about_me, :avatar
    ).merge(user_id: current_user.id)
  end
end
