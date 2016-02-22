class CreateResourcexes < ActiveRecord::Migration
  def change
    create_table :resourcexes do |t|
      t.string :type
      t.text :meta
      t.boolean :add_to_site, default: false

      t.timestamps null: false
    end
  end
end
