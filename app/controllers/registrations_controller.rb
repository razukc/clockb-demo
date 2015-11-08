class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_member_registration_path(resource)
  end
  def after_sign_in_path_for(resource)
    edit_member_registration_path(resource)
  end
end