class Vendor < ApplicationRecord
    # List
    acts_as_list
    
    # Validations
    validates :name, presence: true
    
    # Scopes
    scope :sorted, -> { order(:position) }
    
end
