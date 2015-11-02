class CreateScheduleForMeetings < ActiveRecord::Migration
  def change
    create_table :schedule_for_meetings do |t|
      t.text :content
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
