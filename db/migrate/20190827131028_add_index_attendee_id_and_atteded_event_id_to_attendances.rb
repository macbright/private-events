class AddIndexAttendeeIdAndAttededEventIdToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_index(:attendances, [:attendee_id, :attended_event_id])
  end
end