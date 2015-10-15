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

    context 'guest' do
      before { get :root }

      it_behaves_like 'a successful responder', :json
    end

    context 'authenticated user' do
      let(:user) { create(:user) }

      before do
        authenticate user
        get :root
      end

      it_behaves_like 'a successful responder', :json
    end
  end

  describe 'GET #v1' do
    let(:json) do
      {
        endpoints: {
          posts: 'http://test.host/v1/posts'
        }
      }.to_json
    end

    context 'guest' do
      before { get :v1 }

      it_behaves_like 'a successful responder', :json
    end

    context 'authenticated user' do
      let(:user) { create(:user) }

      before do
        authenticate user
        get :v1
      end

      it_behaves_like 'a successful responder', :json
    end
  end
end
