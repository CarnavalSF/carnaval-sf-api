class Food < ApplicationRecord
    # Image uploader
    include SponsorLogoUploader[:image]
    
    # List
    acts_as_list
    
    # Validations
    validates :name, :description, presence: true
    
    # Scopes
    scope :sorted, -> { order(:position) }
    
end