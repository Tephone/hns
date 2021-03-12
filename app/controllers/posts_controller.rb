class PostsController < ApplicationController
  before_action :authenticate_user!#, only: [:new, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    #@post.user_id = current_user.id
  end
end
