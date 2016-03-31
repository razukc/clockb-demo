class AddDescriptionToNetworkingRequirements < ActiveRecord::Migration
  def change
    add_column :networking_requirements, :description, :text
  end
end
