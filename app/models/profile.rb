class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  has_many :profile_subjects
  has_many :subjects, through: :profile_subjects
end
