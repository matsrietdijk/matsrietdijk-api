module V1
  class PostsController < ::V1::ApplicationController
    def index
      @posts = Post.all
      render json: @posts
    end
  end
end
