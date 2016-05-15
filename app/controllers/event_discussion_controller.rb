class EventDiscussionController < ApplicationController
	def new
		@event_discussion = EventDiscussion.new
	end
end
