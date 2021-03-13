class PostsController < ApplicationController
  before_action :authenticate_user!#, only: [:new, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :user_id)
  end
end
 