class TutorsController < ApplicationController
  expose :profile, scope: -> { Profile.includes(:user).only_tutors }, id: -> { params[:id] }
end
