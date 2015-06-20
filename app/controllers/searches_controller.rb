class SearchesController < ApplicationController
	## Pry pauses the code where 'binding pry' is inserted into the code.
	## Good for testing.
	require 'pry'

	def search
	## :type refers to the param in a hidden text input field in the search partial.
	## :id refers to the param in a hidden text input field in the search partial.
	## :location refers to the input in the text field in the search partial.
	## .near is a method that is defined by the geocoder gem, giving the ability
	## to search via proximity to the location inputted into the search field.
		if params[:type] == "subcategory"
      		skills = Skill.where(subcategory_id: params[:id])
      		location = (params[:location])
      		@skills = skills.near(location, 30)
      		@skills
    	end

    ## Due to skills not being directed associated to categories, an empty array is
    ##  created and is shoveled skills that are filtered.
    	elsif params[:type] == "category"

			@subcategories = Subcategory.where(category_id: params[:id])
			@skills = []
			@subcategories.each do |subcategory|
				location = (params[:location])
				temp_skills = Skill.where(subcategory_id: subcategory.id).near(location, 30)[0]
				@skills << temp_skills unless temp_skills.nil?
				@skills 
			end
		end

		respond_to do |format|
       		format.html {
            	render
        	}
        	format.json {
            	render json: @skills
       		}
       	end

	end


	
	def results
	end
end
