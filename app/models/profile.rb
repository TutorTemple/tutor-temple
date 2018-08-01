class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  enum gender: { male: 0, female: 1 }.freeze

  validates :first_name, :last_name, :gender, :birthday, presence: true
end
