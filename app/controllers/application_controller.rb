class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #ログインした後のパス
    case resource
    when Admin
      admin_users_path
    when User
      user_path(@user.id)
    end
  end


  def after_sign_out_path_for(resource) #ログアウトした後のパス
    case resource
    when :admin
      homes_top_path
    when :user
      homes_top_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :gender, :introduction, :telephone_number, :image]) #新規登録したら保存されるデータのカラム
  end

end
