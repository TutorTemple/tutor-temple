require 'rails_helper'

RSpec.describe ProfileSubject, type: :model do
  it { is_expected.to belong_to(:subject) }
  it { is_expected.to belong_to(:profile) }
end
