class Sponsor < ApplicationRecord
  # Image uploader
  include SponsorLogoUploader[:logo]

  # List
  acts_as_list

  # Validations
  validates :name, :website, presence: true

  # Scopes
  scope :sorted, -> { order(:position) }

  # API methods
  def logo_thumbnail
    logo_url(:thumbnail)
  end

  def logo_original
    logo_url(:original)
  end
end
