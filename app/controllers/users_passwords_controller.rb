class UsersPasswordsController < Devise::PasswordsController
	def new
		@user = User.new
		render 'users/passwords/new'
	end
	def edit
		@user = User.new
		set_minimum_password_length
    	@user.reset_password_token = params[:reset_password_token]
		render 'users/passwords/edit'
	end
end