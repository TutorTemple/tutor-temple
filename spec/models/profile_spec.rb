require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:work_experiences).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:birthday) }
  end

  describe '#full_name' do
    let(:profile) { create(:profile, first_name: 'Anna', last_name: 'Brown') }

    subject { profile.full_name }

    it { is_expected.to eq('Anna Brown') }
  end
end
