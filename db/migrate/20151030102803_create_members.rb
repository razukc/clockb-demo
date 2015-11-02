class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.boolean :company
      t.string :person_in_charge
      t.string :contact_number
      t.string :occupation
      t.integer :package

      t.timestamps null: false
    end
  end
end
