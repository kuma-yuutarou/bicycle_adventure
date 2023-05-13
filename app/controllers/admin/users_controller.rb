class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
  end

  def withdrawal
    @user = User.find(params[:user_id])
    if @user.update(is_active: false)
      #reset_session 今ログインしている人がログアウト
      redirect_to admin_users_path
    else
      render :unsubscribe
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :image, :name, :age, :gender, :introduction, :telephone_number, :is_active )
  end
end
