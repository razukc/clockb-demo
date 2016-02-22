class AddAttachToResourcexes < ActiveRecord::Migration
  def change
    add_column :resourcexes, :attach, :string
  end
end
