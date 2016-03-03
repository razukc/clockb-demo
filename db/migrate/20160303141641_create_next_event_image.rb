class CreateNextEventImage < ActiveRecord::Migration
  def change
    create_table :next_event_images do |t|
      t.string :image
    end
  end
end
