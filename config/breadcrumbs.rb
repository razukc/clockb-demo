crumb :events_upcoming do
	link "UPCOMING EVENTS" , upcoming_events_path
	parent :events
end
crumb :my_events do |my_events|
	link "MY EVENTS", my_events_path
end
crumb :root do
  link "Home", root_path
end

crumb :events do
	link :events , events_path
end

crumb :event do |event|
	link event.name, event_path(event)
	parent :events
end

crumb :members do |members|
	# link :members, members_path
end

crumb :member do |member|
	link member.email, edit_member_registration_path(member)
	parent :members
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).