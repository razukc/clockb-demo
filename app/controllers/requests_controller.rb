class RequestsController < ApplicationController
	
	def new
		@request = Request.new
		@request_for = params[:request_for] ? params[:request_for] : 'unknown'
		render partial: "requests/form"
	end
	
	def create
		@request = Request.create(requests_params)
		
		respond_to do |format|
			# if @request.save
				format.html {redirect_to '/'}
				format.js {}
				# format.json { render :json => @request, :status => :created, location: @request}
			# else
				# format.js {}
				# format.js { render :json => @request.errors, :status => :unprocessable_entity}
			# end	
		end
	end
	
	private
		def requests_params
			properties_keys = params[:request][:request_by].keys
			params.require(:request).permit(:request_for, :attachment, :attachment_cache, request_by: properties_keys)
		end
		
		def post_params
			permit_key_params(params[:post]) do
				params.require(:post)
			end
		end

		def permit_key_params(hash)
			permitted_params = yield
			hash.keys.each do |key|
				values = hash.delete(key)
				permitted_params[key] = values if values
			end
			permitted_params
		end
end
