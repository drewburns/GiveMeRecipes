module Api
	class RecipesController < ApplicationController
		respond_to :json
		require 'base64'
		# before_filter :restrict_access, only: :create

		def index
		end

		def create
			file_path = 'public/uploads/'+ SecureRandom.hex + '.jpg'
			@file = File.open(file_path, 'wb') do|f|
			  f.write(Base64.decode64(params[:file_data]))
			end
			# Cloudinary::Uploader.upload('public/uploads/#{file_path}')


			@recipe = Recipe.create(user_id: params[:user_id], name: params[:name], description: params[:description], ingredients: params[:ingredients], instructions: params[:instructions], picture: File.open(Rails.root + file_path) )
			@recipe.save

			File.delete(file_path)
			# @recipe.save
			render :nothing => true
		end

		private 

		def recipe_params
	    params.require(:recipe).permit(:user_id, :name, :description , :ingredients , :instructions, :file_data)
	  end

		def restrict_access
		  authenticate_or_request_with_http_token do |token, options|
		    ApiKey.exists?(access_token: token)
		  end
		end
	end
end

