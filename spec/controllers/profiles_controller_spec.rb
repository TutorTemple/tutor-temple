require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user, role: 'student') }
  let(:profile) { create(:profile) }

  subject { response }

  before { sign_in user, scope: :user }

  describe '#show' do
    before { get :show, params: { id: profile.id } }

    it { is_expected.to have_http_status(:success) }
  end

  describe '#create' do
    let(:params) { { profile: attributes_for(:profile), user_id: user } }

    before { post :create, params: params }

    it { is_expected.to have_http_status(:success) }
  end

  describe '#update' do
    let(:params) { { profile: attributes_for(:profile), user_id: user } }

    before { post :update, params: params }

    it { is_expected.to have_http_status(:success) }
  end
end
