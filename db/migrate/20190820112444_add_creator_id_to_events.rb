class AddCreatorIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :create_id, :integer
  end
end
