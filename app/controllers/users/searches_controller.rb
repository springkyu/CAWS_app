class Users::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @keyword = params[:keyword]
    if @model == "Post"
    #  @posts = Post.search(@keyword).page(params[:page]).per(8)
      @posts = Post.search(@keyword)
    else
      @posts = Area.search(@keyword)
      @posts_area = Post.where(area_id: @posts.ids)
    end

    # エリア名で検索できない
    # @keyword = params.dig(:search, :value)
    # @posts = Post.search(@keyword)

    # エリア名でしか検索できない
    # @area_id = Area.find_by(area: @keyword).id
    # @posts = Post.where(area_id: @area_id)

  end


end
