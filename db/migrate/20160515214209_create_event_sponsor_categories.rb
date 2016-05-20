class CreateEventSponsorCategories < ActiveRecord::Migration
  def change
    create_table :event_sponsor_categories do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
