class Education < ApplicationRecord
  belongs_to :profile

  validates :degree, presence: true
  validates :institution, presence: true
  validates :graduating_year, presence: true

  enum education_type: { high_school: 0, colegue: 1, university: 2 }.freeze
end
