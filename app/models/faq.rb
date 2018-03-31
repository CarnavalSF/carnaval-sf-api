class Faq < ApplicationRecord
  # List
  acts_as_list

  # Validations
  validates :question, :answer, presence: true

  # Scopes
  scope :sorted, -> { order(:position) }
end
