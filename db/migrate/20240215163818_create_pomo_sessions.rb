class CreatePomoSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :pomo_sessions do |t|
      t.string :session_type
      t.integer :total_time
      t.string :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
