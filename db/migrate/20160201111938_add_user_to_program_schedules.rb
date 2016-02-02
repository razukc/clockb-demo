class AddUserToProgramSchedules < ActiveRecord::Migration
  def change
    add_reference :program_schedules, :user, index: true, foreign_key: true
  end
end
