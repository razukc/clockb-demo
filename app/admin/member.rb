ActiveAdmin.register Member do

config.batch_actions = false

actions :all, except: [:edit, :new, :destroy]
config.per_page = 10

index :download_links => false do
  serial_number = 0 
  column "S.N " do
  	serial_number = serial_number + 1
  end
  column :name do |n|
  	link_to n.name, admin_member_path(n)
  end
  column :person_in_charge
  column :email
  column :contact_number
  column :package
  column :company, :class => "text-align-right"
end

filter :name
filter :company
permit_params :name, :person_in_charge, 
	:email, :contact_number, :package, :occupation, :company

end
