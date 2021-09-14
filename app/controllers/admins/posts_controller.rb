class Admins::PostsController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def destroy
  end

end
