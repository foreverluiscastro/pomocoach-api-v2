class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :study_goal
      t.integer :daily_goal
      t.string :details

      t.timestamps
    end
  end
end
