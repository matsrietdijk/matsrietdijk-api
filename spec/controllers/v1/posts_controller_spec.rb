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
        data = [published_posts, meta: meta, each_serializer: Public::PostSerializer]
        serializable = ActiveModel::SerializableResource.new(*data)
        get :index
        expect(response.body).to eq(serializable.to_json)
      end

      it 'assigns published posts paginated to @posts' do
        published_posts = create_list(:post, 2, :published)
        create(:post, :concept)
        get :index
        expect(assigns(:posts)).to eq(published_posts)
      end

      it 'contains keys' do
        get :index
        body_hash = JSON.parse(response.body, symbolize_names: true)
        expect(body_hash.keys).to eq([:posts, :meta])
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
        data = [all_posts, meta: meta, each_serializer: Admin::PostSerializer]
        serializable = ActiveModel::SerializableResource.new(*data)
        get :index
        expect(response.body).to eq(serializable.to_json)
      end

      it 'assigns all posts paginated to @posts' do
        create_list(:post, 2, :published)
        create_list(:post, 2, :concept)
        get :index
        expect(assigns(:posts)).to eq(Post.page)
      end

      it 'contains keys' do
        get :index
        body_hash = JSON.parse(response.body, symbolize_names: true)
        expect(body_hash.keys).to eq([:posts, :meta])
      end
    end
  end
end
