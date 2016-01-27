class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :inputs
      t.string :attachment

      t.timestamps null: false
    end
  end
end
