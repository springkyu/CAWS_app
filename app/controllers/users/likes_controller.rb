class Users::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.create(post_id: params[:post_id])
    like.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.where(post_id: @post.id, user_id: current_user.id)
    like.destroy_all
    # redirect_back(fallback_location: root_path)
  end

end