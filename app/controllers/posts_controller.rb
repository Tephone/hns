class PostsController < ApplicationController
  before_action :authenticate_user!#, only: [:new, :edit, :update, :destroy]
  before_action :which_post?, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_parameter)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(permitted_parameter)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def which_post?
    @post = Post.find(params[:id])
  end
  def permitted_parameter
    params.require(:post).permit(:content, :image, :image_cache, :user_id)
  end
end
 