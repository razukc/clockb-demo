class ChangeColumnTypeToText < ActiveRecord::Migration
  def change
  	change_column :requests, :request_by, :text
  	change_column :requests, :request_for, :text
  end
end
