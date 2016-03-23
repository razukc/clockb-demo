class UsersWebsitesController < DeviseController
	def create
		@users_website = UsersWebsite.create(users_website_params)
		respond_to do |format|
			format.html {redirect_to dashboard_path}
			format.js {}
		end
	end
	private
	def users_website_params
		params.require(:users_website).permit(:address)
	end
end