class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  def previous
    events.where('event_date < :current_date',
                          current_date: DateTime.now)
  end
  
  def upcoming
    events.where('event_date >= :current_date',
                          current_date: DateTime.now)
  end
end
