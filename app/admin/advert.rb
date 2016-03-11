ActiveAdmin.register Advert do
actions :all, except: [:new, :create, :show, :edit, :update]
config.filters = false
config.batch_actions = false
# index download_links: false
# menu false
# index :download_links => false, as: :grid do |advert|
#   dd "Posted by: " 
#   dd link_to User.find_by_id(advert.user_id).email, admin_user_path(advert.user_id)
#   dd br
#   dd link_to image_tag(advert.image.thumb), admin_advert_path(advert)
#   dd br
#   dd para truncate advert.content

# end	
index download_links: false do
	column :image do |img|
		image_tag img.image_url(:thumb)
	end
	column "Description", :content
	column :created_at
	column "Posted by", :user_id do |user|
		link_to User.find_by_id(user.user_id).email
	end
	actions
end
end
