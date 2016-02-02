class AddUserToScheduleForMeetings < ActiveRecord::Migration
  def change
    add_reference :schedule_for_meetings, :user, index: true, foreign_key: true
  end
end
