class ChangeCreatorColumnInEvents < ActiveRecord::Migration
  def change
    remove_column :events, :creator, :string
  end
end
