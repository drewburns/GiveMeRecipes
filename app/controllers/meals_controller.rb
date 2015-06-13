class MealsController < ApplicationController
	before_action :authenticate_user!, except: :index
	def create
		@meal = current_user.meals.build(meal_params)
		if @meal.save
			# Flash something
			redirect_to user_path(current_user)
		else
			# Flash something
			redirect_to user_path(current_user)
		end
	end

	def delete
	end

	private

	def meal_params
    params.require(:meal).permit( :recipe_id, :for_date)
  end
end
