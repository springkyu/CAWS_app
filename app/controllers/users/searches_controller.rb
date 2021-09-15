class Users::SearchesController < ApplicationController

  def search
    @keyword = params["search"]["value"]
    @datas = search_for(@keyword)
  end


end
