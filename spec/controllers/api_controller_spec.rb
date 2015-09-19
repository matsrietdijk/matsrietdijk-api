require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe 'GET #root' do
    it 'responds successfully with status 200' do
      get :root
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  end
end
