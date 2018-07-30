# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationMailer do
  describe '._layout' do
    subject { described_class._layout }
    it { is_expected.to eq('mailer') }
  end

  describe '.default_params' do
    subject { described_class.default_params }
    it { is_expected.to match(a_hash_including(from: 'from@example.com')) }
  end
end
