class Users::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @keyword = params[:keyword]
    if @model == "Post"
      @posts = Post.search(params[:keyword])
    else
      @areas = Post.search(params[:keyword])
    end

    # エリア名で検索できない
    # @keyword = params.dig(:search, :value)
    # @posts = Post.search(@keyword)

    # エリア名でしか検索できない
    # @area_id = Area.find_by(area: @keyword).id
    # @posts = Post.where(area_id: @area_id)

  end


end
