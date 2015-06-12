module ApplicationHelper
	def give_title(title)
		site = "GiveMeRecipes"
		if title.empty?
			site
		else
			"#{title} | #{site}"
		end
	end
end
