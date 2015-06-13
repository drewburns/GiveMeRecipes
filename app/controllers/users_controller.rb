class UsersController < ApplicationController
	before_action :authenticate_user!, except: :index
	def show
		@user = User.find(params[:id])
		@meals = Meal.where(user_id: params[:id])
		@dates = Meal.new.available_dates(@user)
		@meal = Meal.new
	end

	def index
	end
end
