class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #ログインした後のパス
    users_path
  end

  def after_sign_out_path_for(resource) #ログアウトした後のパス
    homes_top_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :gender, :introduction, :telephone_number]) #新規登録したら保存されるデータのカラム　※アイコン画像imageを
  end

end
