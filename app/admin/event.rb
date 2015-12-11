ActiveAdmin.register Event do

config.batch_actions = false

actions :all#, except: [:show]
config.per_page = 10

index :download_links => false do
  serial_number = 0 
  column " " do
  	serial_number = serial_number + 1
  end
  column :name do |n|
  	link_to n.name, admin_event_path(n)
  end
  column :start_date do |s_d|
  	s_d.start_date.strftime("%A, %d %B, %Y")
  end
  column 'Attendees', :id do |id|
    Event.single_event_attendees_count(id)
  end
end

filter :name
filter :start_date
permit_params :name, :start_date

form do |f|
	f.inputs "Event Details" do
		f.input :name
		f.input :start_date, as: :datepicker,
			datepicker_options: {date_format:"DD, d MM, yy", min_date:0}
	end
	f.actions	
end

show do
      tabs do
        tab 'Overview' do
          attributes_table do
            row(:name)
            row(:start_date)
          end
        end

        tab 'Attendees' do
          table_for event.members do
            column(:name) { |p| p.name.titleize }
            column(:contact_number)
            column(:email)
          end
        end
      end
end

end
