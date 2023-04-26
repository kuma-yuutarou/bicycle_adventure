class UsersController < ApplicationController
  before_action :set_user, only: [:likes]
  
  def likes
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end
  
  def show
    @user = current_user #ログインしているユーザー
    @posts = Post.all
  end

  def edit
    @users = current_user #複数系でログインしているユーザー
  end

  def update
    @users = current_user
    if @users.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def unsubscribe

  end

  def withdrawal
    @users = current_user
    if @users.update(is_active: false)
      reset_session
      redirect_to homes_top_path
    else
      render :unsubscribe
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :age, :gender, :introduction, :image, :email, :telephone_number, :encrypted_password, :is_active)
  end

end
