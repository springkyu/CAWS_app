class Users::SearchesController < ApplicationController

  def search
    @keyword = params.dig(:search, :value)
    @posts = Post.search(@keyword)
  end


end
