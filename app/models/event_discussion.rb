class EventDiscussion < ActiveRecord::Base
  belongs_to :event
  def self.event_discussion_replies(event_id, in_reply_to)
  	EventDiscussion.where(:event_id => event_id, :in_reply_to => in_reply_to)
  end
end

