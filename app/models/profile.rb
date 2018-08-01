class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
end
