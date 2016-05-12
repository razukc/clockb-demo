class AddJoinAsClockBFreelancerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :join_as_clock_b_freelancer, :boolean, default: false
  end
end
