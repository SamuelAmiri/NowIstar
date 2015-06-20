class SearchesController < ApplicationController
	require 'pry'
	def search

		if params[:type] == "subcategory"
      		skills = Skill.where(subcategory_id: params[:id])
      		location = (params[:location])
      		@skills = skills.near(location, 20)
      		@skills
      		# @skills = skills.near(location, 20)
    	elsif params[:type] == "category"

			@subcategories = Subcategory.where(category_id: params[:id])
			@skills = []
			@subcategories.each do |subcategory|
				temp_skill = Skill.where(subcategory_id: subcategory.id, zipcode: params[:location])[0]
					@skills << temp_skill unless temp_skill.nil? 
			end
		end


	end


	
	def results
	end
end
