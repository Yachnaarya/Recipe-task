class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :name, length: { minimum: 0}
end
