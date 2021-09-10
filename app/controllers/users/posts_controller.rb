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
      redirect_back(fallback_location: root_path)
      # @user = current_user
      # @posts = Post.all
      # render :index
    end
  end

  def index
    @posts = Post.all
    # @post = Post.new
    @user = current_user
  end

  def show
    @newpost = Post.new
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      flash[:notice]="Post was successfully updated."
      redirect_back post_path(@post.id)
    else
      render :edit
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post was successfully destroyed."
      redirect_to books_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:shop_name, :image, :body, :location)
  end

end
