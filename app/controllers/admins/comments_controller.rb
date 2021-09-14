class Admins::CommentsController < ApplicationController

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end


  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
