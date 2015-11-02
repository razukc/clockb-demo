class AddNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :start_date, :date
  end
end
