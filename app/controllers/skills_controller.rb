class SkillsController < ApplicationController
  require 'pry'


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

  def search 

    if params[:type ] == "subcategory"
      @skills = Skill.where(subcategory_id: params[:id], zipcode: params[:location])
      

    elsif params[:type] == "category"
      @skills = Category.search(id: params[:id], location: params[:search][:location])

    # @skills = Skill.search(skill: params[:search][:skill], location: params[:search][:location])
    end
  end
  
  def self.search(skill:, location:)

    @skills = Skill.where("name ILIKE ? OR description ILIKE ?", "%" + skill + "%", "%" + skill + "%") if skill.present?
    @skills = skills.near(location, 20) if location.present? && skill.present?
    @skills

  end

  

private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:title, :subcategory_id, :price, :description, :image, :address, :city, :zipcode, :state)
  end

end
