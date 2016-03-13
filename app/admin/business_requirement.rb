ActiveAdmin.register BusinessRequirement do
config.filters = false
config.batch_actions = false
actions :all, except: [:new, :create, :edit, :update, :show]
index download_links: false do
	column "Requirement", :content
	column "Posted by", :user_id do |user|
		link_to User.find_by_id(user.user_id).email
	end
	column :created_at
	actions
end

controller do
	after_destroy { |record| Usermeetup.destroy_all(:service_offered => true, :user_x => record.id) }
end

end
