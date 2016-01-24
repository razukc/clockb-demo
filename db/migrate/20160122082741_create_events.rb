class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :form_params
      t.text :link_params
      t.text :extra_params
      t.date :start_date
      t.string :attachment

      t.timestamps null: false
    end
  end
end
