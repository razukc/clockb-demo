class CreateEsewaPayments < ActiveRecord::Migration
  def change
    create_table :esewa_payments do |t|
      t.string :product_id
      t.string :reference_id
      t.float :amount

      t.timestamps null: false
    end
  end
end
