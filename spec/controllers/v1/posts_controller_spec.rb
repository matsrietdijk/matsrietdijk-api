require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  describe 'GET #index' do
    context 'guest' do
      it 'responds successfully with status 200' do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'responds with published posts json' do
        published_posts = create_list(:post, 2, :published)
        meta = Post.published.page.index_meta
        serializable = ActiveModel::SerializableResource.new(published_posts, meta: meta)
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

    context 'authenticated user' do
      let(:user) { create(:user) }

      before { authenticate user }

      it 'responds successfully with status 200' do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'responds with all posts json' do
        create_list(:post, 2, :published)
        create_list(:post, 2, :concept)
        all_posts = Post.page
        meta = all_posts.index_meta
        serializable = ActiveModel::SerializableResource.new(all_posts, meta: meta)
        get :index
        expect(response.body).to eq(serializable.to_json)
      end

      it 'assigns all posts to @posts' do
        create_list(:post, 2, :published)
        create_list(:post, 2, :concept)
        get :index
        expect(assigns(:posts)).to eq(Post.all)
      end
    end
  end
end
