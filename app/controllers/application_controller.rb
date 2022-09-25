class ApplicationController < ActionController::Base
  before_action :authenticate_user! #ログインしてない場合、ログイン画面に移す
  before_action :configure_permitted_parameters, if: :devise_controller?
  #configure_permitted_parametersは「許可されたパラメータを設定する」という意味のメソッド
  #devise_controller?は「deviseにまつわる画面に行った際に」という意味

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
