# frozen_string_literal: true

class AddIndexCreatorIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_index(:events, :creator_id)
  end
end
