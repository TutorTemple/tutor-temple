require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:profile).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_acceptance_of(:terms) }
    it { accept_nested_attributes_for(:profile) }
  end
end
