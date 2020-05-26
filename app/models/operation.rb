class Operation < ApplicationRecord
  belongs_to :material
  belongs_to :user

  enum category: %i[add minus]
end
