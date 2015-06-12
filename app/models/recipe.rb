class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :meals
	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 140 }
	validates :ingredients,  presence: true, length: { maximum: 300 }
	validates :instructions,  presence: true, length: { maximum: 1000 }
end
