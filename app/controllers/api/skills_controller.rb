module 
	API class SkillsController < ApplicationController
	protect_from_forgery with: :null_session
	
		def index
			render json: Skill.all
		end

		def show
			render json: Skill.find(params[:id])
		end
	end
end