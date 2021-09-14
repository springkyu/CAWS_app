class Admins::PostsController < ApplicationController

  def index
    path = Rails.application.routes.recognize_path(request.referer)
    # path[:controller]で遷移元コントローラーを、path[:action]でアクションを取得
    if path[:controller] == "admins/users" && path[:action] == "show"
      # ユーザの詳細ページから、そのユーザだけの投稿一覧を見たい時
      @posts = Post.where(user_id: path[:id]).page(params[:page]).reverse_order 
    else
      # 全ユーザの投稿一覧
      @posts = Post.all.page(params[:page]).reverse_order
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
    end
  end

end