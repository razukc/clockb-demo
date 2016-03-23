class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  
  # before_filter :ensure_domain, if: :Rails.env.production?

  # APP_DOMAIN = 'www.clockb.com'

  # def ensure_domain
  #   if request.env['HTTP_HOST'] != APP_DOMAIN
  #     # HTTP 301 is a "permanent" redirect
  #     redirect_to "http://#{APP_DOMAIN}", :status => 301
  #   end
  # end

  protected


  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, inputs: []) }
  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password)}
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(users_websites: [:address]) }
  end

  def authenticate_inviter!

    # authenticate_admin!(:force => true)
  end

end
