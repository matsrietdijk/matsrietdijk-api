require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe 'GET #root' do
    it 'responds successfully with status 200' do
      get :root
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'returns the available api versions with url' do
      get :root
      json = {
        versions: {
          v1: 'http://test.host/v1'
        }
      }.to_json
      expect(response.body).to eq(json)
    end
  end

  describe 'GET #v1' do
    it 'responds successfully with status 200' do
      get :v1
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'returns the root level endpoints' do
      get :v1
      json = {
        endpoints: {
          posts: 'http://test.host/v1/posts'
        }
      }.to_json
      expect(response.body).to eq(json)
    end
  end
end
