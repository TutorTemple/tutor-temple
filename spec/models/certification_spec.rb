require 'rails_helper'

RSpec.describe Certification, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:institution) }
    it { is_expected.to validate_presence_of(:termination_date) }
  end
end
