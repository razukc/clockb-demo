class ResourcexesController < ApplicationController
	layout 'pages'
def index
	@resources = params[:scope] ? Resourcex.by_category(params[:scope]).by_add_to_site : Resourcex.all.by_add_to_site
end
end