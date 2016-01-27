class CreateFeedbackFromUsers < ActiveRecord::Migration
  def change
    create_table :feedback_from_users do |t|
      t.text :feedback
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
