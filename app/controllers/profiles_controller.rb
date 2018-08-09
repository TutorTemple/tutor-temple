class ProfilesController < ApplicationController
  skip_before_action :check_profile_completion, only: %i[new create update]
  expose :profile, (-> { Profile.find_or_initialize_by(user_id: current_user.id) })

  def create
    profile.assign_attributes(profile_params)
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
      :first_name, :last_name, :gender, :birthday, :phone_number,
      :about_me, :avatar, :time_zone, languages: [], subject_ids: [],
                                      certifications_attributes: %i[id name institution attachment
                                                                    termination_date _destroy]
    ).merge(user_id: current_user.id).tap do |permitted_params|
      permitted_params[:languages]&.reject!(&:blank?)
      permitted_params[:subject_ids]&.reject!(&:blank?)
    end
  end
end
