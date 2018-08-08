require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let!(:profile) { create(:profile, first_name: 'John') }
  let!(:profile_subject) { create(:subject) }
  let!(:with_subject) { profile.subjects << profile_subject }
  let!(:second_profile) { create(:profile, first_name: 'Jane', last_name: 'Doe') }
  let!(:params) { { search_query: 'Jo' } }

  describe 'GET #index' do
    it 'returns search results' do
      get :index, params: params

      expect(response).to have_http_status(:success)
    end
  end
end
