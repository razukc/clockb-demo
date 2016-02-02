class ProfilesController < ApplicationController
def index
	@profile_category = @k = params[:k]
	@profiles = User.find_by_profile(@profile_category)
	render partial: "profiles/index"
end
end