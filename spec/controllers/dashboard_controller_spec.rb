require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { profile.user }
  let(:profile) { create :profile }

  subject { response }

  before { sign_in user, scope: :user }

  describe '#index' do
    subject { get :index }

    it { is_expected.to render_template(:index) }
  end
end
