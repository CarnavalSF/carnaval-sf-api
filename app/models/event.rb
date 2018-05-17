class Event < ApplicationRecord
  # List
  acts_as_list

  # Validations
  validates :title, :location, :time, :end_time, presence: true

  # Scopes
  scope :sorted, -> { order(:time) }
end
