require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with status 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'responds with published posts json' do
      published_posts = create_list(:post, 2, :published)
      serializable = ActiveModel::SerializableResource.new(published_posts)
      get :index
      expect(response.body).to eq(serializable.to_json)
    end

    it 'assigns published posts to @posts' do
      published_posts = create_list(:post, 2, :published)
      create(:post, :concept)
      get :index
      expect(assigns(:posts)).to eq(published_posts)
    end
  end
end
