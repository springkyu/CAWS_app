class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    # コメントのidを探してきて、destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

end
