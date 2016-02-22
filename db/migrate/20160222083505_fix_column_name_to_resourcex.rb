class FixColumnNameToResourcex < ActiveRecord::Migration
  def change
  	rename_column :resourcexes, :type, :category
  end
end
