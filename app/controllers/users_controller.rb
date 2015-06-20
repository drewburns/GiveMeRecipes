class UsersController < ApplicationController
	before_action :authenticate_user!, except: :index
	def show
		@user = User.find(params[:id])
		@meals = Meal.where(user_id: params[:id]).where("for_date > ?", Date.yesterday).sort_by{|e| e[:for_date]}
		@dates = Meal.new.available_dates(current_user)
		@meal = Meal.new
	end

	def index
		if user_signed_in?
			redirect_to current_user
		end
	end
end
