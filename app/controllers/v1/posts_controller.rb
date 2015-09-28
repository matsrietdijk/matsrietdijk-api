module V1
  class PostsController < ::V1::ApplicationController
    def index
      @posts = Post.published.page(params[:page]).per(params[:count])
      render json: @posts, meta: @posts.index_meta
    end
  end
end
