class Subject < ApplicationRecord
  has_many :profile_subjects
  has_many :profiles, through: :profile_subjects

  validates :name, presence: true, uniqueness: true
end
