class SocialMediaLinksController < ApplicationController
	before_action :premium_only
	def get_user
		User.find(params[:user_id])
	end
	def new
		@user = get_user
		@new_social_media_link = @user.social_media_links.build
		render partial: 'form'
	end
	def create
		@user = get_user
		@social_media_link = @user.social_media_links.build(social_media_links_params)
		@social_media_link.save
		respond_to do |format| 
			format.html {redirect_to '/dashboard'}
			format.js {}
		end
	end
	def update
		@social_media_link = SocialMediaLink.find(params[:id])
		respond_to do |format|
		if @social_media_link.update_attributes(social_media_links_params)
			format.html
			format.json { respond_with_bip(@social_media_link)}
		end
		end
	end
	def destroy
		@social_media_link = SocialMediaLink.find(params[:id])
		respond_to do |format|
			if @social_media_link.destroy
				format.html
				format.js { }
			end
		end
	end
	def premium_only
		unless current_user.premium?
			render partial: 'shared/upgrade_to_premium', locals: {_x: 'premium', _y: 'social_media_links', _z: current_user.id}
		end
	end
	
	private

	def social_media_links_params
		params.require(:social_media_link).permit(:media, :link)
	end
end