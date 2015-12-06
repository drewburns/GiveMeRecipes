class RecipesController < ApplicationController
	before_action :authenticate_user!, only: [:create , :new]
	before_action :correct_user! , only: [:edit]

	def index
		puts "_______________"
		puts params
		if user_signed_in?
			@user = current_user
			@dates = Meal.new.available_dates(@user)
			@meal = Meal.new
			@recipes = Recipe.all
		else
			@recipes = Recipe.all
		end
		respond_to do |format|
      format.html
      format.json
    end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def create
		puts recipe_params
		@recipe = current_user.recipes.build(recipe_params)
		if @recipe.save
			redirect_to recipe_path(@recipe) , :notice => "Recipe Created!"
		else
			redirect_to 'recipes/new' , :alert => "Please retry"
		end
	end

	def new
		@recipe = Recipe.new
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update_attributes(recipe_params)
			redirect_to recipe_path(@recipe) , :notice => "Recipe Updated!"
		else
			redirect_to(:back)
		end
	end

	def destroy
		@user = current_user
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to @user , :notice => "Recipe Deleted"
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def search
		@recipes = []
		params[:search].split("+").each do |word|
			result = Recipe.where("name like ?", "%" + word + "%")
			if result.count > 0
					result.each do |result|
						@recipes << result
					end
			end
		end
		p @recipes
		render 'search.json.rabl'
	end

	private

	def recipe_params
    params.require(:recipe).permit(:name, :description , :ingredients , :instructions, :picture, :picture_cache)
  end

	def correct_user!
		recipe = Recipe.find(params[:id])
	  @user = User.find(recipe.user.id)
    redirect_to(root_url) unless current_user == (@user)
	end

end
