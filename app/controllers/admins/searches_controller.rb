class Admins::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @keyword = params[:keyword]
    if @model == "Post"
      @posts = Post.search(@keyword).page(params[:page]).per(8)
    else
      @posts = Area.search(@keyword)
      @posts_area = Post.where(area_id: @posts.ids).page(params[:page]).per(8)
    end
  end

end
