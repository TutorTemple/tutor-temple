require 'rails_helper'

RSpec.describe Education, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:degree) }
    it { is_expected.to validate_presence_of(:institution) }
    it { is_expected.to validate_presence_of(:graduating_year) }
  end
end
