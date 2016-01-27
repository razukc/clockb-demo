class FeedbackFromUsersController < ApplicationController
def new
	@feedback = FeedbackFromUser.new
end

def create
	@feedback = FeedbackFromUser.create(feedback_params)
	respond_to do |format|
		format.html {redirect_to '/dashboard'}
		format.js {}
	end
end

private

	def feedback_params
		params.require(:feedback_from_user).permit(:feedback, :user_id)
	end
end