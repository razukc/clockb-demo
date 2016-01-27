=begin
ActiveAdmin.register Alumni do

config.batch_actions = false
actions :all, except: [:show]
config.per_page = 10

index :download_links => false do
  sn = 0
  column " " do
    sn = sn+1
  end
  column :name do |n|
    link_to n.name, edit_admin_alumni_path(n)
  end
  column :contact
  column :email
  column :affiliated_date
  column :company, :class => 'text-align-right'
end

filter :company
filter :name

permit_params :company, :name, :person_in_charge, :contact, 
  :email, :affiliated_date, :client_background, :remove_client_background,
  milestone_alumnis_attributes: [:id, :content, :achieved, :_destroy],
  recommended_services_attributes: [:id, :content, :_destroy]


form do |f|
  tabs do
    tab "Profile" do
      f.inputs "Basic" do
        f.input :name
        f.input :company
        f.input :person_in_charge
        f.input :contact
        f.input :email, :placeholder => "user@domain.com"
        f.input :affiliated_date, as: :datepicker, datepicker_options: {date_format: "d MM, yy"}        
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
    tab 'Milestones' do
      f.has_many :milestone_alumnis, allow_destroy: true, :heading => 'Milestones',
      new_record: 'Add new' do |ms|
        ms.input :content, as: :text,
          :input_html => { :class => 'autogrow', :rows => 10, :cols => 20}
        ms.input :achieved, as: :boolean
      end
    end
    tab 'Recommended Services' do
      f.has_many :recommended_services, allow_destroy: true,
      new_record: 'Add new' do |rs|
        rs.input :content, as: :text, 
          :input_html => { :class => 'autogrow', :rows => 10, :cols => 20}
      end
    end
  end
  f.actions
end

end
=end
