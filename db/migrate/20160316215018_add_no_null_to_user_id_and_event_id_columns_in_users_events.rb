class AddNoNullToUserIdAndEventIdColumnsInUsersEvents < ActiveRecord::Migration
  def up
    change_column :users_events, :user_id, :integer, null: false
    change_column :users_events, :event_id, :integer, null: false
  end

  def down
    change_column :users_events, :user_id, :integer
    change_column :users_events, :event_id, :integer
  end
end
