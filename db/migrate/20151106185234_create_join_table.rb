class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :events, :members do |t|
      t.index [:event_id, :member_id]
      t.index [:member_id, :event_id]
    end
  end
end
