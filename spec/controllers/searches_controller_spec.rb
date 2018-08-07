require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let!(:profile) { create(:profile, first_name: 'John') }
  let!(:second_profile) { create(:profile, first_name: 'Jane', last_name: 'Doe') }
  let!(:params) { { search_query: 'Jo' } }

  describe 'GET #index' do
    it 'returns search results' do
      get :index, params: params

      expect(assigns(:profiles)).to include(profile)
      expect(assigns(:profiles)).to_not include(second_profile)
    end

    it 'returns all profiles' do
      get :index, params: {}

      expect(assigns(:profiles)).to include(profile)
      expect(assigns(:profiles)).to include(second_profile)
    end
  end
end
