class ApplicationController < ActionController::Base

  # devise に関するコントローラ処理のみ実行
  before_action :configure_permitted_parameters,if: :devise_controller?

  # devise の Userモデルに関わるパラメーターを取得できるようになる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
