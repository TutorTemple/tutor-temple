require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:auth_params) { OpenStruct.new(FakedAuth.new.facebook_data) }
  let(:user_params) { OpenStruct.new('role': 'student') }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = auth_params
    request.env['omniauth.params'] = user_params
    allow_any_instance_of(AuthenticationService).to receive(:create).and_return(user)
  end

  describe '#create_and_sign_in' do
    subject { get :facebook }

    context 'successful signup' do
      let(:user) { create(:student) }

      it { is_expected.to redirect_to(root_path) }
    end

    context 'failed signup' do
      let(:user) { build(:user, role: nil) }

      it { is_expected.to redirect_to(new_user_registration_path) }
    end
  end
end
