class Users::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
    @areas = Area.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "You have creatad post successfully."
      redirect_to post_path(@post)
    else
      @areas = Area.all
      flash[:alert] = "Could not create post."
      render :new
    end
  end

  def index
    # @posts = Post.all.order(params[:sort])
    # ページネーションを適用
    @posts = Post.all.order(params[:sort]).page(params[:page]).per(8)
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
    @areas = Area.all
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
      flash[:notice] = "Post was successfully updated."
      redirect_to post_path(@post.id)
    else
      @areas = Area.all
      flash[:alert] = "Could not update."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post was successfully destroyed."
      redirect_to posts_path
    else
      flash[:alert] = "Could not destroy."
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:shop_name, :image, :body, :rate, :area_id, :location)
  end

end
