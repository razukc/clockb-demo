ActiveAdmin.register Client do

config.batch_actions = false

actions :all, except: [:show]
config.per_page = 10

index :download_links => false do
  serial_number = 0 
  column " " do
  	serial_number = serial_number + 1
  end
  column :name do |n|
  	link_to n.name, edit_admin_client_path(n)
  end
  column :contact
  column :email
  column :affiliated_date
  column :company, :class => "text-align-right"
end

filter :name
filter :company
permit_params :company, :name, :person_in_charge, :remove_client_background,
	:contact, :email, :affiliated_date, :client_background,
	services_catereds_attributes: [:id, :content, :_destroy],
	program_schedules_attributes: [:id, :content, :_destroy],
	milestones_attributes: [:id, :content, :achieved, :_destroy],
	feedbacks_of_the_services_attributes: [:id, :content, :_destroy],
	schedule_for_meetings_attributes: [:id, :content, :_destroy]

# :html => { :multipart => true }
form do |f|
	f.semantic_errors
	tabs do
		tab 'Profile' do	
			f.inputs "Basic" do
				f.input :name
				f.input :company
				f.input :person_in_charge
				f.input :contact
				f.input :email, :placeholder => 'user@domain.com'
				f.input :affiliated_date, as: :datepicker,
					datepicker_options: {date_format: "d MM, yy"}
			end
			f.inputs "Client Background" do
				if f.object.client_background && f.object.client_background.file
					li link_to "#{f.object.client_background.file.filename}", f.object.client_background.url
					f.input :remove_client_background, as: :boolean, :label => "Remove"
				else
					f.input :client_background, as: :file, :label => "Upload"
					f.input :client_background_cache, as: :hidden
				end
			end
		end
		tab 'Services Catered' do
			f.has_many :services_catereds, allow_destroy: true,
			new_record: 'Add new' do |sc|
				sc.input :content, as: :text, 
					:input_html => { :class => 'autogrow', :rows => 10, :cols => 20}
			end
		end
		tab 'Program Schedules' do
			f.has_many :program_schedules, allow_destroy: true,
			new_record: 'Add new' do |ps|
				ps.input :content, as: :datepicker, 
				datepicker_options: {date_format:"DD, d MM, yy"}
			end
		end
		tab 'Milestones' do
			f.has_many :milestones, allow_destroy: true,
			new_record: 'Add new' do |ms|
				ms.input :content, as: :text,
					:input_html => { :class => 'autogrow', :rows => 10, :cols => 20}
				ms.input :achieved, as: :boolean
			end
		end
		tab 'Feedbacks' do
			f.has_many :feedbacks_of_the_services, allow_destroy: true,
			new_record: 'Add new' do |fb|
				fb.input :content, as: :text,
					:input_html => { :class => 'autogrow', :rows => 10, :cols => 20}
			end
		end
		tab 'Meeting Schedules' do
			f.has_many :schedule_for_meetings, allow_destroy: true,
			new_record: 'Add new' do |sm|
				sm.input :content, as: :datepicker, 
				# :input_html => {:rel => {"dateFormat":"DD, d MM, yy"}}
				datepicker_options: {date_format:"DD, d MM, yy"}
			end
		end
	end
	f.actions
end


end
