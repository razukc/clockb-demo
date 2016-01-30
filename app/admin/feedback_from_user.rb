ActiveAdmin.register FeedbackFromUser, as: "Feedback" do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
actions :all, except: [:new, :create, :edit, :update, :destroy, :show]
config.filters = false
index download_links: false do
	column "Date", :created_at
	column "Sent by", :user_id do |user|
		link_to User.find_by_id(user.user_id).email, admin_user_path(user.user_id)
	end
	column :feedback	
end

end
