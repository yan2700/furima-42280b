class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
end