class Usermeetup < ActiveRecord::Base
  belongs_to :user

def self.has_requested_meetup(user_id, target_user)
Usermeetup.where(:user_id => user_id, :user_x => target_user, :meetup => true).limit(1)
end
end
