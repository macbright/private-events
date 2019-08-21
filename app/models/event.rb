class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances
  default_scope -> { order(event_date: :asc) }
  scope :previous_e, -> { where('event_date < :current_date', current_date: DateTime.now) }
  scope :upcoming_e, -> { where('event_date >= :current_date', current_date: DateTime.now) }

end
