class Users::PostsController < ApplicationController

  def new
    @post = Post.new
    @areas = Area.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      flash[:notice]="You have creatad post successfully."
      redirect_to post_path(@post)
    else
      # redirect_back(fallback_location: root_path)
      @user = current_user
      @posts = Post.all
      render :index
    end
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
    @user = current_user
  end

  def show
    @newpost = Post.new
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      flash[:notice]="Post was successfully updated."
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "Could not update."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post was successfully destroyed."
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:shop_name, :image, :body, :location, :area_id)
  end

end
