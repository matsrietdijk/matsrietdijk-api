require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with status 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns published posts to @posts' do
      published_post = Post.create(state: :published, title: '', body: '')
      Post.create(title: '', body: '')
      get :index
      expect(assigns(:posts)).to eq([published_post])
    end
  end
end
