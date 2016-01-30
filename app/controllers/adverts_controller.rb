class AdvertsController < ApplicationController
	before_action :authenticate_user!
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
		format.html {'/dashboard'}
		format.js {}
	end
end

private
def advert_params
	params.require(:advert).permit(:content, :image, 
		:image_cache, :user_id)
end

end