class CreateUsermeetups < ActiveRecord::Migration
  def change
    create_table :usermeetups do |t|
      t.text :meta
      t.integer :user_x
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
