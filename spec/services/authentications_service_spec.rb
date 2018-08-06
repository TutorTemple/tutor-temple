require 'rails_helper'

RSpec.describe AuthenticationService do
  describe 'create' do
    let(:auth_params) { OpenStruct.new(FakedAuth.new.facebook_data) }
    let(:user_params) { OpenStruct.new('role': 'student') }
    let(:data) { { auth_params: auth_params, user_params: user_params, current_user: current_user } }
    let!(:provider) { create(:facebook_provider) }

    subject { -> { described_class.new(data).create } }

    context 'when user and authorization were not created yet' do
      let(:current_user) { nil }

      it { is_expected.to change(User, :count).by(1) }
      it { is_expected.to change(UserAuthentication, :count).by(1) }
    end

    context 'when user already exists and authorization is not' do
      let!(:current_user) { create(:student, email: auth_params.info['email']) }

      it { is_expected.not_to change(User, :count) }
      it { is_expected.to change(UserAuthentication, :count).by(1) }
    end

    context 'when user and authorization are exist' do
      let(:current_user) { create(:student, email: auth_params.info['email']) }
      let!(:user_authentication) { create(:facebook_user_authentication, uid: auth_params.uid, user: current_user) }

      it { is_expected.not_to change(User, :count) }
      it { is_expected.not_to change(UserAuthentication, :count) }
    end
  end
end
