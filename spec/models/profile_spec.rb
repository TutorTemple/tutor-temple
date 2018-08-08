require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:work_experiences).dependent(:destroy) }
    it { is_expected.to have_many(:profile_subjects) }
    it { is_expected.to have_many(:certifications).dependent(:destroy) }
    it { is_expected.to have_many(:subjects).through(:profile_subjects) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { accept_nested_attributes_for(:certifications) }
  end

  describe '#full_name' do
    let(:profile) { create(:profile, first_name: 'Anna', last_name: 'Brown') }

    subject { profile.full_name }

    it { is_expected.to eq('Anna Brown') }
  end

  describe '.search_profiles' do
    let(:profile) { create(:profile, first_name: 'Joe', last_name: 'Brown') }
    let!(:profile_subject) { create(:subject) }
    let!(:with_subject) { profile.subjects << profile_subject }

    let!(:params) { 'Jo' }

    subject { described_class.search_profiles(params) }

    context 'search profile' do
      it { is_expected.to include(profile) }
    end

    context 'search profile by subject' do
      let!(:params) { profile_subject.name }

      it { is_expected.to include(profile) }
    end
  end
end
