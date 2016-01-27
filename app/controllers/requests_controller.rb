class RequestsController < ApplicationController
	
	def new
		@request = Request.new
		@_x = params[:_x] ? params[:_x] : '_x'
		@_y = params[:_y] ? params[:_y] : '_y'
		@_z = params[:_z] ? params[:_z] : '_z'
		@_id = @_z ? @_z.to_i : 0
		
		case @_x
		when 'vacancy'
		@_title = @_id > 0 ? Vacancy.find_by_id(@_id).content['job_title'] : '_title'
		when 'event'	
		@_title = @_id > 0 ? Event.find_by_id(@_id).form_params['name'] : '_title'
		when 'internship'
		@_title = 'Apply as a intern'
		when 'meeting'
		@_title = 'Request for a meeting'
		when 'webinar'
		@_title = 'Request for a Webinar'
		else
		@_title = '_title'
		end

		render partial: "requests/form"
	end
	
	def create
		@request = Request.create(requests_params)
		
		respond_to do |format|
			# if @request.save
				format.html {redirect_to '/'}
				format.js {}
				# format.json { render :json => @request, :status => :created, 
				# location: @request}
			# else
				# format.js {}
				# format.js { render :json => @request.errors, 
				# :status => :unprocessable_entity}
			# end	
		end
	end
	
	private
		def link_params
			["_x", "_y", "_z"]
		end
		def form_params
			["name", "company", "phone", "email",
			 "comment"]
		end
		def extra_params
			["attachment_cache"]
		end
		def requests_params
			# properties_keys = params[:request][:request_by].keys
			# params.require(:request).permit(:request_for, :attachment, :attachment_cache,
			params.require(:request).permit(:attachment, :attachment_cache, 
				link_params: link_params, form_params: form_params)
			 # request_by: properties_keys)
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
