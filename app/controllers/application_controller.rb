class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_payjp_key
  before_action :basic_auth
  protected

 
  def after_sign_in_path_for(resource)
    items_path
  end

  
  def after_sign_up_path_for(resource)
    items_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :birthday, :last_name, :first_name, :last_name_kana, :first_name_kana
    ])
  end  

  def set_payjp_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end