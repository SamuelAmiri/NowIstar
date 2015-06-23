class SkillsController < ApplicationController
  require 'pry'
  ## Private actions that will be loaded prior to all others, except Index and Search

  before_filter :load_user, except: [:index, :search]

  def index
    @skills = Skill.all
	respond_to do |format|
  		format.html {
  			render
  		}
  		format.json {
  			render json: @skills
  		}
  	end
  end

  def show
    @skill = @user.skills.find(params[:id])
    respond_to do |format|
       	format.html {
            render
        }
        format.json {
            render json: @skill
       	}
    end
  end

  def new
    @skill = @user.skills.new
    @catagories = Category.all
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
      if @skill.save
        flash[:success] = "Your Skill has been saved"
        redirect_to user_path(current_user)
      else
        render :new
      end
  end

  def edit
    @skill = Skill.find(params[:id])  
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update(skill_params)
      flash[:success] = "Your Skill has been updated"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    Skill.find(params[:id]).destroy
    flash[:Congrats] = "You have deleted your skill!"
    redirect_to user_path
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
