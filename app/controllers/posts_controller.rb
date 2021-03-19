class PostsController < ApplicationController
  before_action :which_post?, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #, only: [:new, :create, :edit, :update, :destroy]
  before_action :can_do_only_by_myself, only: [:edit, :update, :destroy]
 
  def index
    @posts = Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_parameter)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path, notice: '投稿しました！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(permitted_parameter)
      redirect_to posts_path, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '削除しました！'
  end

  private
  def which_post?
    @post = Post.find(params[:id])
  end

  def permitted_parameter
    params.require(:post).permit(:content, :image, :image_cache, :user_id)
  end

  def can_do_only_by_myself
    unless current_user == @post.user
      render :show
    end
  end
end