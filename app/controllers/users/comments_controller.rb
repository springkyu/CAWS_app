class Users::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comment.new(comment_params)
    comment.post_id = post.id
    comment.save
    render :index
  end

  def edit
  end

  def update
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    render :index
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
