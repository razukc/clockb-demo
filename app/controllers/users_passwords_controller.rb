class UsersPasswordsController < Devise::PasswordsController
	layout 'pages'
	def new
		# @user = User.new
		    self.resource = resource_class.new
		render 'users/passwords/new'
	end
	def edit
		@user = User.new
		set_minimum_password_length
    	@user.reset_password_token = params[:reset_password_token]
		render 'users/passwords/edit'
	end
	  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      # respond_with(resource)
      render 'users/passwords/new'
    end
  end
end