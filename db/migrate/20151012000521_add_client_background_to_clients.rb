class AddClientBackgroundToClients < ActiveRecord::Migration
  def change
    add_column :clients, :client_background, :string
  end
end
