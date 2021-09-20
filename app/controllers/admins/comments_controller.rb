class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end


  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

end
