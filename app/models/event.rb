class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances
  default_scope -> { order(event_date: :asc) }

  scope :previous_events, -> { where('event_date < :current_date', current_date: DateTime.now) }
  scope :upcoming_events, -> { where('event_date >= :current_date', current_date: DateTime.now) }
  validates :title, uniqueness: true
  validates :title, presence: true, length: { minimum: 4, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 150 }
  validates :location,  presence: true, length: { minimum: 4, maximum: 80 }
  validates :event_date, presence: true
  validates :creator_id, presence: true

  def attended?(user_id)
    self.attendees.ids.include?(user_id)
  end

  def pasted?
    self.event_date < Date.today
  end

end
