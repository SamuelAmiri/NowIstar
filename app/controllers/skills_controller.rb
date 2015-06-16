class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = set_skill
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
      if @skill.save
        redirect_to skills_path
      else
        render :new
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

paramsrivate

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:title, :subcategory_id, :price, :description, :image)
  end

end
