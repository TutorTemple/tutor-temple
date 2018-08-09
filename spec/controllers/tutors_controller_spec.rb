require 'rails_helper'

RSpec.describe TutorsController, type: :controller do
  let(:user) { profile.user }
  let(:profile) { create(:profile) }

  subject { response }

  before { sign_in user, scope: :user }

  describe '#show' do
    before { get :show, params: { id: profile.id } }

    it { is_expected.to render_template(:show) }
  end
end
