# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances
  default_scope -> { order(event_date: :asc) }

  scope :previous_events, -> { where('event_date < :current_date', current_date: DateTime.now) }
  scope :upcoming_events, -> { where('event_date >= :current_date', current_date: DateTime.now) }

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :event_date, presence: true
  validates :creator_id, presence: true

  def attended?(user_id)
    attendees.ids.include?(user_id)
  end

  def pasted?
    event_date < Date.today
  end
end
