require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #authenticate' do
    let(:user) { create(:user) }

    it 'responds with 401 without username' do
      post :authenticate, params: { user: { password: user.password } }
      is_expected.to respond_with(401)
    end

    it 'responds with 401 without password' do
      post :authenticate, params: { user: { username: user.username } }
      is_expected.to respond_with(401)
    end

    it 'responds with 401 without username & password' do
      post :authenticate, params: { user: {} }
      is_expected.to respond_with(401)
    end

    it 'responds with 401 without params' do
      post :authenticate
      is_expected.to respond_with(401)
    end

    context 'valid request' do
      let(:json) { ActiveModel::SerializableResource.new(user).to_json }

      before do
        post :authenticate, params: { user: { username: user.username, password: user.password } }
      end

      it_behaves_like 'a successful responder', :json
    end
  end
end
