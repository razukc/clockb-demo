class UsersSessionsController < Devise::SessionsController
	# layout 'pages'
	def new
		@user = User.new
		render 'users/sessions/new'
	end
end