require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let!(:profile) { create(:profile, :with_subject, first_name: 'John') }
  let!(:params) { { search_query: 'Jo' } }

  describe 'GET #index' do
    it 'returns search results' do
      get :index, params: params

      expect(response).to have_http_status(:success)
    end
  end
end
