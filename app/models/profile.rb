class Profile < ApplicationRecord
  enum gender: { male: 0, female: 1 }.freeze

  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  has_many :profile_subjects
  has_many :subjects, through: :profile_subjects
  has_many :work_experiences, dependent: :destroy
  has_many :certifications, inverse_of: :profile, dependent: :destroy

  accepts_nested_attributes_for :certifications, reject_if: :all_blank, allow_destroy: true

  store_accessor :meta, :languages
  store_accessor :meta, :time_zone

  validates :first_name, :last_name, :gender, :birthday, :time_zone, :languages, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: I18n.t('profiles.error.names') },
                                     length: { in: 2..15 }
  validate :not_future_birthday

  delegate :email, :role, to: :user

  scope :only_tutors, (-> { where(users: { role: :tutor }) })

  def full_name
    [first_name, last_name].join(' ')
  end

  private

  def not_future_birthday
    return unless birthday
    errors.add(:birthday, message: I18n.t('profiles.error.birthday_error')) if birthday > Time.now
  end
end
