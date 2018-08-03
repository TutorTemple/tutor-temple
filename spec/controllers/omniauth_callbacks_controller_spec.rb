require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:auth_params) { OpenStruct.new(FakedAuth.new.facebook_data) }
  let(:user_params) { OpenStruct.new({ 'role': 'student' }) }
  
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = auth_params 
    request.env['omniauth.params'] = user_params 
    allow(AuthenticationService).to receive(:create).with(
        auth_params: auth_params, 
        current_user: nil, 
        user_params: user_params
      ).and_return(user)
  end
  let(:user) { create(:student) }

  describe '#create_and_sign_in' do
    subject { get :facebook }

    it { is_expected.to redirect_to(root_path) }
  end
end
