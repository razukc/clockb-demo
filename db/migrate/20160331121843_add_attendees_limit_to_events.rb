class AddAttendeesLimitToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attendees_limit, :integer
  end
end
