class Education < ApplicationRecord
  belongs_to :profile

  validates :degree, presence: true
  validates :institution, presence: true
  validates :graduating_year, presence: true
end
