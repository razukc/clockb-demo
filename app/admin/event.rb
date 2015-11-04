ActiveAdmin.register Event do

config.batch_actions = false

actions :all, except: [:show]
config.per_page = 10

index :download_links => false do
  serial_number = 0 
  column " " do
  	serial_number = serial_number + 1
  end
  column :name do |n|
  	link_to n.name, edit_admin_event_path(n)
  end
  column :start_date do |s_d|
  	s_d.start_date.strftime("%A, %d %B, %Y")
  end
end

filter :name
filter :start_date
permit_params :name, :start_date

form do |f|
	f.inputs "Event Details" do
		f.input :name
		f.input :start_date, as: :datepicker,
			datepicker_options: {date_format:"DD, d MM, yy"}
	end
	f.actions	
end


end