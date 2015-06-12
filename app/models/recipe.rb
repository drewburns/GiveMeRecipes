class Recipe < ActiveRecord::Base
	belongs_to :user
	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 140 }
	validates :ingredients,  presence: true, length: { maximum: 300 }
	validates :directions,  presence: true, length: { maximum: 1000 }
end
