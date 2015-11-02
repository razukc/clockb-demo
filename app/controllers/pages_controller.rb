class PagesController < ApplicationController
	def index
		@client = Client.first
	end
end
