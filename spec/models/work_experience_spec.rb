require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:company_name) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:start_date) }

    context 'invalid dates' do
      let(:prodile) { build(:profile) }
      subject do
        build :work_experience, company_name: :company_name,
                                title: :title,
                                location: :location,
                                start_date: 1.month.from_now,
                                end_date: 1.day.from_now
      end

      it { is_expected.not_to be_valid }

      before { subject.validate }
      it 'validates correctly' do
        expect(subject.errors.details).to include(
          start_date: [{ error: :must_be_in_past },
                       { error: :must_be_before_end_date }],
          end_date: [{ error: :must_be_in_past }]
        )
      end
    end
  end
end
