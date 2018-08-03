class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  has_many :profile_subjects
  has_many :subjects, through: :profile_subjects

  enum gender: { male: 0, female: 1 }.freeze

  validates :first_name, :last_name, :gender, :birthday, presence: true
  validate :not_future_birthday

  private

  def not_future_birthday
    return unless birthday
    errors.add(:birthday, t('profiles.error.birthday_error')) if birthday > Time.now
  end
end
