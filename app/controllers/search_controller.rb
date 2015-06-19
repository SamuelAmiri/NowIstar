class SearchController < ApplicationController
	
	def search 

		if params[:type ] == "subcategory"
			@skills = Skill.where(subcategory_id: params[:id], zipcode: params[:location])

		elsif params[:type] == "category"
			@subcategories = Subcategory.where(category_id: params[:id])
			
			@skills = Skill.where(subcategory_id: params[:id], zipcode: params[:location])
		end

	end

  def results
  end
end
