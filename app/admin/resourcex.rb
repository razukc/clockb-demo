ActiveAdmin.register Resourcex, as: "Resource" do
config.filters = false
index download_links: false do
	column :category do |k|
		k.category.titleize
	end
	column :meta, "Title" do |k|
		link_to k.meta['title'], edit_admin_resource_path(k)
	end
	column :add_to_site
	column :created_at
	actions
end
permit_params :category, :add_to_site, :attach, :attach_cache, :remove_attach, meta: []
form :html => { :multipart => true } do |f|
	f.semantic_errors *f.object.errors.keys
	if f.object.new_record? 
		f.inputs "Add new resource" do
			f.input :category, as: :radio, include_blank: false,
			collection: [["Blog", "blog",{ :checked => true }],["Newsletter","newsletter"],["Video","video"]]
		end
	f.actions
	else
		f.render f.object.category
	end
end
controller do
	def edit
		@resourcex = Resourcex.find_by_id(params[:id])
		# render @user.inputs['type'], layout: 'active_admin',
		# 	locals: { user: @user }	
	end
	def update
		@resourcex = Resourcex.find_by_id(params[:id])
		if @resourcex.update(resourcex_params)
		flash[:success] = "User has been successfully updated." 
		redirect_to admin_resources_path
		else
		messages = @resourcex.errors.full_messages.map { |msg| msg }.join
		flash[:error] = "Error: " + messages
		redirect_to edit_admin_resource_path(@resourcex)
		end
	end
	def create
		@resourcex = Resourcex.new(resourcex_params)
		if @resourcex.save && @resourcex.errors.empty?
		redirect_to edit_admin_resource_path(@resourcex)
		else
		messages = @resourcex.errors.full_messages.map { |msg| msg }.join
		flash[:error] = "Error: " + messages
		redirect_to new_admin_resource_path(@resourcex)
		end
	end
	def resourcex_params
		meta_keys = params[:resourcex][:meta] ? params[:resourcex][:meta].keys : []
		params.require(:resourcex).permit(:category, :add_to_site, :attach, :attach_cache, :remove_attach, meta: meta_keys)
	end
end
end
