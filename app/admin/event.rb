ActiveAdmin.register Event do

permit_params :form_params, :link_params, :extra_params, :start_date, :attachment,
	:attachment_cache
index download_links: false do 
	# column :form_params
	column "Type" do |k|
		span k.form_params['type'].titleize
	end
	column :start_date
	
	column "Event", :form_params do |k, v|
		k['form_params']['name']
		end
	column "Description", :form_params do |k, v|
		truncate k['form_params']['description']
		end
	column "Start Time" do |k|
		k.form_params['start_time']
	end
	column "Venue" do |k|
		k.form_params['venue']
	end
	actions
end
# index as: :block, download_links: false do |product|
#   div for: product do
#     # resource_selection_cell product
#     h3  link_to     product.form_params['name'], edit_admin_event_path(product)
#     div "Start Date: " << product.start_date.strftime('%A, %B %e, %Y')
#     # div truncate product.form_params['description']
#     br
#   end
# end
actions :all, except: [:show]
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
		f.input :start_date, as: :datepicker, #:date_time_picker,
			# datepicker_options: {format:"l, F d, Y H:i A"}
			datepicker_options: {date_format:"DD, MM d, yy"}
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

# index download_links: false do 
# 	column "Event", :form_params do |k, v|
# 		k['form_params']['name']
# 		end
# 	actions
# end
# index as: :blog, download_links: false do
#   title do |post|
#     span post.form_params['name'], class: 'title'
#     # span post.created_at, class: 'created_at'
#   end
#   body do |post|
#     div truncate post.form_params['description']
#     div class: 'meta' do
#       span "Posted in #{post.form_params['type'].titleize}"
#     end
#   end
# end
end
