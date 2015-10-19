module V1
  class PostsController < ::V1::ApplicationController
    def index
      @posts = posts_scope.page(params[:page]).per(params[:count])
      render json: @posts, meta: @posts.index_meta, each_serializer: post_serializer
    end

    def show
      @post = posts_scope.find(params[:id])
      render json: @post, serializer: post_serializer
    end

    private

    def posts_scope
      @current_user.present? ? Post.all : Post.published
    end

    def post_serializer
      @current_user.present? ? Admin::PostSerializer : Public::PostSerializer
    end
  end
end
