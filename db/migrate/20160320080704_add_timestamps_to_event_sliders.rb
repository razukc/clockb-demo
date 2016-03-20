class AddTimestampsToEventSliders < ActiveRecord::Migration
  def change
  	change_table :events_sliders do |t|
      t.timestamps
    end
  end
end
