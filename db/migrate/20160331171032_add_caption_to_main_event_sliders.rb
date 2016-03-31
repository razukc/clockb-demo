class AddCaptionToMainEventSliders < ActiveRecord::Migration
  def change
    add_column :main_event_sliders, :caption, :text
  end
end
