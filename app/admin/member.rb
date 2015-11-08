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
  	link_to n.name.titleize, admin_member_path(n)
  end
  column :person_in_charge
  column :email
  column :contact_number
  column :package do |pkg| pkg.package.titleize end
  column :company, :class => "text-align-right"
end

filter :name
filter :company
permit_params :name, :person_in_charge, 
	:email, :contact_number, :package, :occupation, :company


show do
      tabs do
        tab 'Overview' do
          attributes_table do
            row(:name)
            row(:company)
            row(:email)
            row(:person_in_charge)
            row(:contact_number)
            row(:occupation)
            row(:package)
          end
        end

        tab 'Events' do
          table_for member.events do
            column(:name) { |p| p.name.titleize }
            column(:start_date)
            column("Status", :id) {|p| Event.status(p)}
          end
        end
      end
end

end
