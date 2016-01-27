class UsersSessionsController < Devise::SessionsController
	def new
		@user = User.new
		render 'users/sessions/new'
	end
end