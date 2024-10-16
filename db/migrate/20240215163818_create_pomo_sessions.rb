class CreatePomoSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :pomo_sessions do |t|
      t.string :session_type, null: false
      t.integer :total_secs, null: false
      t.datetime :session_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
