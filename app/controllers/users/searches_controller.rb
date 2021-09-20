class Users::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @keyword = params[:keyword]
    if @model == "Post"
      @posts = Post.search(@keyword)
    else
      @posts = Area.search(@keyword).page(params[:page]).per(8)
      @posts_area = Post.search(area_id: @posts.ids).page(params[:page]).per(8)
    end

    # エリア名で検索できない
    # @keyword = params.dig(:search, :value)
    # @posts = Post.search(@keyword)

    # エリア名でしか検索できない
    # @area_id = Area.find_by(area: @keyword).id
    # @posts = Post.where(area_id: @area_id)

  end


end
