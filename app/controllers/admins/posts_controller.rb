class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    # path[:controller]で遷移元コントローラーを、path[:action]でアクションを取得
    path = Rails.application.routes.recognize_path(request.referer)

    # ユーザの詳細ページから、そのユーザだけの投稿一覧を見たい時
    if path[:controller] == "admins/users" && path[:action] == "show"
      @posts = Post.where(user_id: path[:id]).page(params[:page]).reverse_order
    else
    # 全ユーザの投稿一覧
      @posts = Post.all.order(params[:sort]).page(params[:page]).per(8)
    end
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
    else
      flash[:alert] = "Could not destroy."
      redirect_back(fallback_location: root_path)
    end
  end

end
