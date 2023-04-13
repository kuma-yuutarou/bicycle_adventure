class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(comment_params)
    comment.post_id = post_id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :posts_id, :body)
  end
end
