class SkillsController < ApplicationController
  before_filter :load_user, except: :index

  def index
    @skills = Skill.all
  end
  
  def show
    @skill = @user.skills.find(params[:id])
  end

  def new
    @skill = @user.skills.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
      if @skill.save
        flash[:success] = "Your Skill has been saved"
        redirect_to user_skill_path(current_user, @skill)
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
    @skills = Skill.search(skill: params[:search][:skill], location: params[:search][:location])
  end
  
  def self.search(skill:, location:)

    skills = Skill.where("name ILIKE ? OR description ILIKE ?", "%" + skill + "%", "%" + skill + "%") if skill.present?
    skills = skills.near(location, 20) if location.present? && skill.present?
    skills

  end

  

private
  
  def load_user
    @user = User.find(params[:user_id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:title, :subcategory_id, :price, :description, :image, :address, :city, :zipcode, :state)
  end

end
