module Api
	class UsersController < ApplicationController
		def show
			user = User.find(params[:id])
			@recipes = user.recipes.reverse
			render 'api/index.json.rabl'
		end

	end
end