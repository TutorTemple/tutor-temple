class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose :profile, (-> { current_user.profile })

  def create
    current_user.profile.create(profile_params)
  end

  def update
    if profile.update(profile_params)
      flash[:notice] = 'Your profile successfully updated'
    else
      render 'profiles/edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :gender, :birthday, :phone_number, :about_me)
  end
end
