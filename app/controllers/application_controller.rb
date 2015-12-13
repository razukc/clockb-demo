class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :company, :person_in_charge, :occupation, :contact_number, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:package, :password, :password_confirmation, :current_password, :name, :company, :person_in_charge, :occupation, :contact_number) }

  end

  def root_path2
    root_path
  end
end
