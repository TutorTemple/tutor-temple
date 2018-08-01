require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_acceptance_of(:terms) }
  end
end
