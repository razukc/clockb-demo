class CreateEventDiscussions < ActiveRecord::Migration
  def change
    create_table :event_discussions do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.text :comment
      t.integer :in_reply_to, default: 0

      t.timestamps null: false
    end
  end
end
