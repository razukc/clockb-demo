class FeedbackFromUsersController < ApplicationController
def new
	@user = User.find(params[:user_id])
	@new_feedback = @user.feedbacks.build
	render partial: 'form'
end

def create
	@user = User.find(params[:user_id])
	@feedback = @user.feedbacks.build(feedback_params)
	@feedback.save
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