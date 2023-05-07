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

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :image, :name, :age, :gender, :introduction, :telephone_number, :is_active )
  end
end
