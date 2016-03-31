class LogoAndImagesController < ApplicationController
before_action :authenticate_user!
# before_action :premium_only
def new
	@user = get_user
	@new_logo_and_image = @user.logo_and_images.build
	render partial: 'form'
end
def create
	@user = get_user
	@logo_and_image = @user.logo_and_images.build(logo_and_image_params)
	@logo_and_image.save
	respond_to do |format|
		format.html {redirect_to dashboard_path}
		format.js {}
	end
end

def update
	@logo_and_image = LogoAndImage.find(params[:id])
	respond_to do |format|
	if @logo_and_image.update_attributes(logo_and_image_params)
		format.html
		format.json { respond_with_bip(@logo_and_image)}
	end
	end
end
def destroy
	@logo_and_image = LogoAndImage.find(params[:id])
	respond_to do |format|
		if @logo_and_image.destroy
			format.html
			format.js { }
		end
	end
end
def premium_only
	unless current_user.premium?
		render partial: 'shared/upgrade_to_premium', locals: {_x: 'premium', _y: 'logo_and_image', _z: current_user.id}
	end
end
def get_user
	@user = User.find(params[:user_id])
	end
private

def logo_and_image_params
	params.require(:logo_and_image).permit(:content, :user_id)
end
end