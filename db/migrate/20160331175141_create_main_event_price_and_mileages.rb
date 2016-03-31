class CreateMainEventPriceAndMileages < ActiveRecord::Migration
  def change
    create_table :main_event_price_and_mileages do |t|
      t.string :attendee_category
      t.string :price
      t.string :mileage
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
