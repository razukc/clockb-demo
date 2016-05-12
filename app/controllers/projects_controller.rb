class ProjectsController < ApplicationController
	layout 'freelancers'
def show
	@project = Project.find(params[:id])
end
def create
	@user = get_user
	@project = @user.projects.build(projects_params)
	@project.save
	respond_to do |format| 
		format.html {redirect_to '/freelancers'}
		format.js {}
	end
end
private
def get_user
	User.find(params[:user_id])
end

protected
def projects_params
	params.require(:project).permit!
end
end
