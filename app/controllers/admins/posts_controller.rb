class Admins::PostsController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post was successfully destroyed."
      redirect_to admins_posts_path
    end
  end

end