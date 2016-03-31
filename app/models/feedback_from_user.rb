class FeedbackFromUser < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :feedback

end
