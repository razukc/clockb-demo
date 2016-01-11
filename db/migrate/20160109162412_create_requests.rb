class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_by
      t.string :request_for

      t.timestamps null: false
    end
  end
end
