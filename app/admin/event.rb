ActiveAdmin.register Event do

permit_params :form_params, :link_params, :extra_params, :start_date, :attachment,
	:attachment_cache

index download_links: false
config.filters = false
config.batch_actions = false
form do |f|
	f.inputs "Event Details" do
		f.semantic_errors
		f.fields_for :form_params,
		 (OpenStruct.new(Event.find_by_id(params[:id]).form_params) unless f.object.new_record?) do |r|
			r.input :type, :label => 'Main/Weekly', as: :select, :include_blank => false,
				:collection => [["Main", "main"], ["Weekly", "weekly"]] 
			r.input :name, :required => true
			r.input :description, as: :text, input_html: {rows: 6}
			r.input :venue 
			r.input :start_time
		end	
		f.input :start_date, as: :datepicker,
			datepicker_options: {date_format:"DD, d MM, yy"}
		f.input :attachment, as: :file, :label => "Photo"
		li image_tag (f.object.attachment.thumb.url) if f.object.attachment?
		f.input :attachment_cache, as: :hidden
	end
	
	f.actions
end

controller do
	def update
		@event = Event.find_by_id(params[:id])
		if @event.update(event_params)
			redirect_to admin_events_path
		else
			render 'edit'
		end
	end
	def edit
		@event = Event.find_by_id(params[:id])	
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to admin_events_path
		else
			render 'new'
		end
	end

	def event_params
		content_keys = params[:event][:form_params].keys
		params.require(:event).permit(:start_date, :attachment, 
			extra_params: extra_params, form_params: form_params)
	end
	def form_params
		["type", "name", "description", "venue", 
		 "start_time",]
	end
	def extra_params
		["attachment_cache"]
	end
end
end
