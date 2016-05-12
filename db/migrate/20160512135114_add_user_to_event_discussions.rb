class AddUserToEventDiscussions < ActiveRecord::Migration
  def change
  	add_column :event_discussions, :user_id, :integer
  end
end
