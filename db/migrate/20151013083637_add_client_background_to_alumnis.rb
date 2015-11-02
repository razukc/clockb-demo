class AddClientBackgroundToAlumnis < ActiveRecord::Migration
  def change
    add_column :alumnis, :client_background, :string
  end
end
