class Material < ApplicationRecord
  belongs_to :storage
  has_many :operations
  validates_numericality_of :piece, greater_than: 0
end
