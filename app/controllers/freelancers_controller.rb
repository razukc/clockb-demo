class FreelancersController < ApplicationController
	before_action :signed_in_only, except: :index
	layout 'freelancers'

	def book_your_appointment
		@user = current_user
		render partial: 'book_your_appointment'
	end

	def message_freelancer
		@user = current_user
		render partial: 'message_freelancer'
	end

	def book_webinar_appointment
		@user = current_user
		render partial: 'book_webinar_appointment'
	end

	def add_freelance_project
		@user = current_user
		@new_project = @user.projects.build
		render partial: 'add_freelance_project'
	end
	
	def join_as_a_clock_b_freelancer
		@user = current_user
		render partial: 'join_as_a_clock_b_freelancer'
	end
	
	def index
		@user = current_user
		@projects_for_freelancers = Project.where(:public => true)
	end
	protected
	def signed_in_only
		unless user_signed_in?
			render html: "Click <a href='/sign_in'>here</a> to sign in first.".html_safe
		end
	end
end
