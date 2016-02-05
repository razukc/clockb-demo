ActiveAdmin.register FeedbackFromUser, as: "Feedback" do
actions :all, except: [:new, :create, :edit, :update, :destroy]
config.filters = false
menu false
# index download_links: false do
# 	# column "Date", :created_at
# 	# column "Sent by", :user_id do |user|
# 	# 	link_to User.find_by_id(user.user_id).email, admin_user_path(user.user_id)
# 	# end
# 	# column :feedback	
# 	columns
# 	actions
# end

end
