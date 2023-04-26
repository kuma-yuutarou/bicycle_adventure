class NotificationsController < ApplicationController
  def index #いいね通知画面
    liked_post_id = Like.where(user_id: current_user.id).pluck(:post_id)
    @like_posts = Post.where(id: liked_post_id)
  end

  def create
  end
end
