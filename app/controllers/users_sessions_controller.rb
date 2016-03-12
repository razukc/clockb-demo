class UsersSessionsController < Devise::SessionsController
	# layout 'pages'
	def new
		@user = User.new
		render 'users/sessions/new'
	end
	protected
	def after_sign_in_path_for(resource)
	  dashboard_path
	end
end