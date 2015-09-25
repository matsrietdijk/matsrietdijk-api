require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with status 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
