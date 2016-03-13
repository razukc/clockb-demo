ActiveAdmin.register Event do
	config.filters = false
	config.batch_actions = false
	actions :all#, except: [:show]
show title: "Event" do
columns do
column do
panel "Event Details" do
attributes_table_for event do
# row :form_params

row :name do
event['form_params']['name'].titleize
end
row :description do
simple_format event['form_params']['description']
end
row :event_type do
event['form_params']['type'].titleize
end
row :start_date do
event['start_date']
end
row :start_time do
event['form_params']['start_time']
end
row :venue do				
event['form_params']['venue']
end
row :image do
image_tag event.attachment.thumb
end
row :attendees do
Event.attendees(event.id).count + Event.user_attendees(event.id).count
end
end
end
end

column do
	if Event.attendees(event.id).any? || Event.user_attendees(event.id).any?
	div do
		h4 "Attendees"
	end
	end
	Event.attendees(event.id).map do |post|
		panel post.created_at do
			attributes_table_for post do
				row :name do
				post.request_by['name']
				end
				row :company do
				post.request_by['company']
				end
				row :phone do
				post.request_by['phone']
				end
				row :email do
				 post.request_by['email']			
				end
			end
		end
	end
	Event.user_attendees(event.id).map do |post|
		panel post.created_at do
			attributes_table_for post do
				row :user do
				link_to User.find_by_id(post.user_id).email, admin_user_path(post.user_id)
				end
			end
		end
	end
end
end
end

scope :all, default: true
scope "Main", :main
scope "Weekly", :weekly
permit_params :form_params, :link_params, :extra_params, :start_date, :attachment,
:attachment_cache
index download_links: false do 
# column :form_params
# column "Type" do |k|
# 	span k.form_params['type'].titleize
# end

column "Event", :form_params do |k, v|
k['form_params']['name']
end
column :start_date
column "Start Time" do |k|
k.form_params['start_time']
end
column "Venue" do |k|
k.form_params['venue']
end
column "Attendees" do |k|
Event.attendees(k.id).count + Event.user_attendees(k.id).count
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
# actions :all
# config.filters = false
# filter :form_params_cont, label: "keyword"
# filter :start_date
# config.current_filters = false
# config.batch_actions = false
form do |f|
f.semantic_errors
f.inputs "Event Details" do
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
after_destroy { |record| Usermeetup.destroy_all(:event => true, :user_x => record.id) }

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
