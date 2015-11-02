class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.boolean :company
      t.string :name
      t.string :person_in_charge
      t.string :contact
      t.string :email
      t.string :affiliated_date

      t.timestamps null: false
    end
  end
end
