class CreateEventsSlider < ActiveRecord::Migration
  def change
    create_table :events_sliders do |t|
      t.string :image
      t.string :caption
      t.boolean :add_to_site, default: false
    end
  end
end
