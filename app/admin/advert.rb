ActiveAdmin.register Advert do
actions :all, except: [:new, :create, :edit, :update, :destroy]
config.filters = false
index :download_links => false, as: :grid do |advert|
  dd "Posted by: " 
  dd link_to User.find_by_id(advert.user_id).email, admin_user_path(advert.user_id)
  dd br
  dd link_to image_tag(advert.image.thumb), admin_advert_path(advert)
  dd br
  dd para truncate advert.content

end	
# index download_links: false do
# 	column :content
# 	column :image do |img|
# 		image_tag img.thumb.url
# 	end
# 	column :created_at
# 	actions
# end
end
