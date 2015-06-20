class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :meals
	mount_uploader :picture, PictureUploader
	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 140 }
	validates :ingredients,  presence: true, length: { maximum: 300 }
	validates :instructions,  presence: true, length: { maximum: 1000 }
	validate  :picture_size

	private

	def picture_size
    if picture.size > 5.megabytes
      redirect_to 'recipes/new' , :alert => "File to big"
    end
  end
end
