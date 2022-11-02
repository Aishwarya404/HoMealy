# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
	def path_to(page_name)
		case page_name
			when "the Home page" then "/"
            when "the Main page" then "/home/main"
			when "the Log In page" then "/login"	
			when "the Add Dish page" then "/dishes/new"	
			when "the Add Dish error page" then "/dishes"	
			when "the Sign Up page" then "/users/new"
			when "the Sign Up error page" then "/users"
		end
	end
end

World(NavigationHelpers)
