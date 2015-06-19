class SearchController < ApplicationController
	
	def search 

		if params[:type ] == "subcategory"
			@skills = Skill.where(subcategory_id: params[:id], zipcode: params[:location])

		elsif params[:type] == "category"
			@skills = Skill.where(id: params[:id], location: params[:location])
		end

	end

  def results
  end
end
