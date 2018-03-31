class Event < ApplicationRecord
  # List
  acts_as_list

  # Validations
  validates :title, :description, :location, :time, presence: true

  # Scopes
  scope :sorted, -> { order(:position) }
end
