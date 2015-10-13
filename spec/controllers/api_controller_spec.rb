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

    it { is_expected.to respond_with(200) }
    its(:response) { is_expected.to be_success }
    its('response.body') { is_expected.to eq(json) }
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

    it { is_expected.to respond_with(200) }
    its(:response) { is_expected.to be_success }
    its('response.body') { is_expected.to eq(json) }
  end
end
