class ChangeCreateIdToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :create_id, :creator_id
  end
end
