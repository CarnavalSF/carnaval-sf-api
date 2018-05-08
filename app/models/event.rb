class Event < ApplicationRecord
  # Image uploader
  include SponsorLogoUploader[:image]
  
  # List
  acts_as_list

  # Validations
  validates :title, :description, :location, :time, presence: true

  # Scopes
  scope :sorted, -> { order(:time) }
end
