class EventDiscussionsController < ApplicationController

	def create
		
		@event_discussion = EventDiscussion.create(event_discussion_params)
		
		respond_to do |format|
			format.html {redirect_to "/events/#{params[:event_id]}"}
			format.js {}
		end
	end
	private
	def event_discussion_params
		params.require(:event_discussion).permit(:comment, :event_id, :in_reply_to)
	end
end
