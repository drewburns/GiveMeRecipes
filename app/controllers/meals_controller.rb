class MealsController < ApplicationController
	before_action :authenticate_user!, except: :index
	def create
		@meal = current_user.meals.build(meal_params)
		if @meal.save
			redirect_to user_path(current_user) , :notice => "Meal created!"
		else
			redirect_to user_path(current_user) , :alert => "Please Retry"
		end
	end

	def destroy
		@meal = Meal.find(params[:id])
		@meal.destroy
		redirect_to current_user
	end

	private

	def meal_params
    params.require(:meal).permit(:recipe_id, :for_date)
  end
end
