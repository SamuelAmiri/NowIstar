class SearchesController < ApplicationController
	def search
		if params[:type ] == "subcategory"
      		@skills = Skill.where(subcategory_id: params[:id], zipcode: params[:location])
      
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
