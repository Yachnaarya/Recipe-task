class Recipe < ApplicationRecord
	has_many :ingredients
	searchkick
	validates :name, presence: true
	validates :name, length: { maximum: 100 }
	validates :instructions, presence: true
	validates :instructions, length: {maximum: 1000}
	validates :cooking_time, presence: true
	validates :cooking_time, length: { minimum: 0}

end
