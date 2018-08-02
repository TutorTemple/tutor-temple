require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user, role: 'student') }
  let(:profile) { create(:profile) }

  subject { response }

  before { sign_in user, scope: :user }

  describe '#create' do
    let(:params) { { profile: attributes_for(:profile, user_id: user) } }

    before { post :create, params: params }

    context 'valid params' do
      it { is_expected.to redirect_to(dashboard_index_path) }
    end

    context 'invalid params' do
      let(:params) { { profile: attributes_for(:profile, first_name: nil) } }

      it { is_expected.to render_template(:new) }
    end
  end

  describe '#update' do
    let(:params) { { profile: attributes_for(:profile, user_id: user) } }

    before { post :update, params: params }

    context 'valid params' do
      it { is_expected.to redirect_to(profile_path) }
    end

    context 'invalid params' do
      let(:params) { { profile: attributes_for(:profile, first_name: nil) } }

      it { is_expected.to render_template(:edit) }
    end
  end
end
