class Meal < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe
	
	def available_dates(user)
  	this_week = new_week
    final_array = []
  	meals = Meal.where("for_date > ?", Date.yesterday).where(user_id: user.id)
    meals_dates = meals.collect {|meal| meal.for_date}
    this_week.each do |day|
      final_array << day unless meals_dates.include?(day)
    end
    final_array
  end

  def new_week
  	week = []
  	date = Date.today
  	7.times do
  		date = date.advance(:days => 1)
  		week << date
  	end
    week
  end
end
