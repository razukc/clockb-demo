class AddImageToResources < ActiveRecord::Migration
  def change
    add_column :resourcexes, :image, :string
  end
end
