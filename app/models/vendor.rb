class Vendor < ApplicationRecord
    # Image uploader
    include SponsorLogoUploader[:image]
    
    # List
    acts_as_list
    
    # Validations
    validates :name, :description, presence: true
    
    # Scopes
    scope :sorted, -> { order(:position) }
    
    # API methods
    def image_thumbnail
        image_url(:thumbnail)
    end
    
    def image_original
        image_url(:original)
    end
end
