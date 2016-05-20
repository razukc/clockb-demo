class CreateEventSponsorLogos < ActiveRecord::Migration
  def change
    create_table :event_sponsor_logos do |t|
      t.belongs_to :event_sponsor_category, index: true, foreign_key: true
      t.string :logo

      t.timestamps null: false
    end
  end
end
