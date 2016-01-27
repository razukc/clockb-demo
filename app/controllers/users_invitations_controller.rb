class UsersInvitationsController < Devise::InvitationsController

# def create
#     # new user
#     if User.find_by_email(invite_params[:email]).nil?
#       super
#     # existing user
#     else
#       @u = User.find_by_email(invite_params[:email])
#       @u.invite!()
#       if is_flashing_format? && self.resource.invitation_sent_at
#         set_flash_message :notice, :send_instructions, :email => self.resource.email
#       end
#       respond_with resource, :location => after_invite_path_for(current_inviter)
#     end
#   end
  protected

  # invite_resource is called when creating invitation
  # should return an instance of resource class

  # this is devise_invitable's implementation
  # def invite_resource(&block)
  #   resource_class.invite!(invite_params, current_inviter, &block)
  # end

  def invite_resource(&block)
    @user = User.find_by(email: invite_params[:email])
    # @member is an instance or nil
    if @user.nil? #&& @user.email != current_user.email
      # invite! instance method returns a Mail::Message instance
      super
      # @user.invite!(current_user)
      # return the user instance to match expected return type
      # @user
    else
      # invite! class method returns invitable var, which is a User instance
      # resource_class.invite!(invite_params, current_inviter, &block)
      @user.invite!(current_user)
      @user
    end
  end

  # private
  # # this is called when creating invitation
  # # should return an instance of resource class
  # def invite_resource
  #   ## skip sending emails on invite
  #   super do |u|
  #     u.skip_invitation = true
  #   end
  # end

  # # this is called when accepting invitation
  # # should return an instance of resource class
  # def accept_resource
  #   resource = resource_class.accept_invitation!(update_resource_params)
  #   ## Report accepting invitation to analytics
  #   Analytics.report('invite.accept', resource.id)
  #   resource
  # end
end