module V1
  class PostsController < ::V1::ApplicationController
    def index
      @posts = Post.published.page(params[:page]).per(params[:count])
      render json: @posts
    end
  end
end
