class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @posts = @user.posts.page(params[:page]).reverse_order
  end


  def edit
    @user = current_user
  end


  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to users_path
    else
      flash[:alert] = "Could not update."
      render :edit
    end
  end


  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
  end


  def likes
    @user = current_user
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :encrypted_password, :is_deleted)
  end

end
