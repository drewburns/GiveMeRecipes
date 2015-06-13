class RecipesController < ApplicationController
	before_action :authenticate_user!, only: [:create , :new]
	before_action :correct_user! , only: [:edit , :destroy]

	def index
		if user_signed_in?
			@user = current_user
			@dates = Meal.new.available_dates(@user)
			@meal = Meal.new
			@recipes = Recipe.all
		else
			@recipes = Recipe.all
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		if @recipe.save
			# Flash something
			redirect_to recipe_path(@recipe)
		else
			# Flash something
			redirect_to 'recipes/new'
		end
	end

	def new
		@recipe = Recipe.new
	end

	def update
	end

	def destroy
	end

	def edit
	end

	private

	def recipe_params
    params.require(:recipe).permit(:name, :description , :ingredients , :instructions)
  end

	def correct_user!
	  @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == (@user)
	end

end
