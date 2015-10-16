module V1
  class PostsController < ::V1::ApplicationController
    def index
      @posts = posts_scope.page(params[:page]).per(params[:count])
      render json: @posts, meta: @posts.index_meta
    end

    private

    def posts_scope
      @current_user.present? ? Post.all : Post.published
    end
  end
end
