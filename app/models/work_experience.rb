class WorkExperience < ApplicationRecord
  belongs_to :profile

  validates :company_name, :title, :location, :start_date, presence: true
  validates :end_date, presence: true, unless: :current_workplace?
  validate :not_future_date
  validate :start_date_before_end_date

  private

  def not_future_date
    errors.add(:start_date, :must_be_in_past) if start_date && start_date > Time.now
    errors.add(:end_date, :must_be_in_past) if end_date && end_date > Time.now
  end

  def start_date_before_end_date
    return unless end_date
    errors.add(:start_date, :must_be_before_end_date) if start_date > end_date
  end
end
