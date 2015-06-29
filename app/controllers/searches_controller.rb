class SearchesController < ApplicationController
	## Pry pauses the code where 'binding pry' is inserted into the code.
	## Good for testing.
	require 'pry'

	helper_method :sort_column, :sort_direction

	def search
		@skills = Skill.order(sort_column + ' ' + sort_direction)
	## :type refers to the param in a hidden text input field in the search partial.
	## :id refers to the param in a hidden text input field in the search partial.
	## :location refers to the input in the text field in the search partial.
	## .near is a method that is defined by the geocoder gem, giving the ability
	## to search via proximity to the location inputted into the search field.
	
		if params[:type] == "subcategory"
      		skills = Skill.where(subcategory_id: params[:id])
      		location = (params[:location])
      		@skills = skills.near(location, 40)
      		@skills.page(params[:page]).per_page(5)

    ## Due to skills not being directed associated to categories, an empty array is
    ## created and is shoveled skills that are filtered. temp_skills.nil? prevents
    ## lack of results from erroring out.
    	elsif params[:type] == "category"
			@subcategories = Subcategory.where(category_id: params[:id])
			@skills = []
			@subcategories.each do |subcategory|
				location = (params[:location])
				temp_skills = Skill.where(subcategory_id: subcategory.id).near(location, 40)
				unless temp_skills.nil?
					temp_skills.each do |temp_skill|
						@skills << temp_skill
					end
				end
				@skills 
				
			end
		end
	## Defines rendering for both html and JSON.
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

private

  def sort_column  
  Skill.column_names.include?(params[:sort]) ? params[:sort] : "user"  
end  
  
  def sort_direction  
  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
end
end
