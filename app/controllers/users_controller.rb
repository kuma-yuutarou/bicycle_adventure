class UsersController < ApplicationController
  def show
    @user = current_user #ログインしているユーザー
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

  def user_params
    params.require(:user).permit(:name, :age, :gender, :introduction, :image, :email, :telephone_number, :encrypted_password, :is_active)
  end

end
