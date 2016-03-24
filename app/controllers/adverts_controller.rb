class AdvertsController < ApplicationController
before_action :authenticate_user!
before_action :premium_only
def index
@adverts = current_user.adverts
end
def new
@advert = Advert.new
render partial: 'adverts/form'#, locals: {advert: @advert}
end

def create
@advert = Advert.create(advert_params)
respond_to do |format| 
format.html {redirect_to '/dashboard'}
format.js {}
end
end
def update
	@advert = Advert.find(params[:id])
	respond_to do |format|
	if @advert.update_attributes(advert_params)
		format.html
		format.json { respond_with_bip(@advert)}
	end
	end
end
def destroy
	@advert = Advert.find(params[:id])
	respond_to do |format|
		if @advert.destroy
			format.html
			format.js { }
		end
	end
end
def premium_only
unless current_user.premium?
render partial: 'shared/upgrade_to_premium',
locals: {_x: 'premium', _y: 'advert', _z: current_user.id}
end
end
private
def advert_params
params.require(:advert).permit(:content, :image, 
:image_cache, :user_id)
end

end