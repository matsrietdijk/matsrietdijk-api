require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe 'GET #root' do
    let(:json) do
      {
        versions: {
          v1: 'http://test.host/v1'
        }
      }.to_json
    end

    before { get :root }

    it_behaves_like 'a successful responder', :json
  end

  describe 'GET #v1' do
    let(:json) do
      {
        endpoints: {
          posts: 'http://test.host/v1/posts'
        }
      }.to_json
    end

    before { get :v1 }

    it_behaves_like 'a successful responder', :json
  end
end
