class UsersEvents < ActiveRecord::Migration
  def change
    create_table :users_events do |t|
      t.integer :user_id, index: true
      t.integer :event_id, index: true

      t.timestamps null: false
    end
  end
end
