class SearchesController < ApplicationController
	require 'pry'
	def search

		if params[:type] == "subcategory"
      		skills = Skill.where(subcategory_id: params[:id])
      		location = (params[:location])
      		@skills = skills.near(location, 30)
      		@skills
      		# @skills = skills.near(location, 20)
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


	end


	
	def results
	end
end
