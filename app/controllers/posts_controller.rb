class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notic: 'Post created'
    else
      render :index
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
