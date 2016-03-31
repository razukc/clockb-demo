class CreateMainEventSliders < ActiveRecord::Migration
  def change
    create_table :main_event_sliders do |t|
      t.string :image
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
