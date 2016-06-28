class EventDiscussionsController < ApplicationController
	def show
		render partial: "event_discussions/comments"
	end
	def comments
		@new_event_discussion = EventDiscussion.new
    @all_event_discussion = EventDiscussion.where(:event_id => params[:id], :in_reply_to => 0).order('created_at desc')
    
		render partial: "event_discussions/comments", locals: {event_id: params[:id], user_id: 0}
	end
	def create
		
		@event_discussion = EventDiscussion.create(event_discussion_params)
		
		respond_to do |format|
			format.html {redirect_to "/events/#{params[:event_id]}"}
			format.js {}
		end
	end
	
	private
	def event_discussion_params
		params.require(:event_discussion).permit(:comment, :event_id, :in_reply_to, :commenter)
	end
end
