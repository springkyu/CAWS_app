class Users::PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      flash[:notice]="You have creatad book successfully."
      redirect_to post_path(@post)
    else
      redirect_back(fallback_location: root_path)
      # @user = current_user
      # @posts = Post.all
      # render :index
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:shop_name, :image_id, :body, :location)
  end

end
