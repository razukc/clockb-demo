class ProfilesController < ApplicationController
def index
	@profile_category = @k = params[:k]
	@profiles = User.find_by_profile(@profile_category)
	render partial: "profiles/index"
end
def show
	@profile = User.profile(params[:id])
	render partial: "profiles/show"
end
end