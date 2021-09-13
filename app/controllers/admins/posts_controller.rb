class Admins::PostsController < ApplicationController

  def index
    @post = Post.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
