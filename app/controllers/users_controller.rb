class UsersController < ApplicationController
  ## DISPLAYS ALL USERS
  def index
    @users = User.all 
  end

  ## DISPLAYS A SINGLE USER
  def show
    @skills = current_user.skills
  end

  ## USER PUTS IN THEIR INFORMATION
  def new
    @user = User.new
  end

  ## CREATES NEW USER AND MAKES SESSION USER_ID EQUAL TO THE NEWLY CREATED USER AKA AUTOMATICALLY LOGS THEM IN.
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id.to_s
        redirect_to users_path
      else
        render :new
      end
  end

  ## EDITS USER DEPENDING ON USER TYPE
  def edit
   @user = User.find(params[:id])
    if @user.servicer == nil
      render 'usertype'
    else
      render :edit 
    end 
  end

  ## UPDATES USER PARAMS AND REDIRECTS TO THE INDEX. PREVENTS PEOPLE FROM ALTERING OTHER'S PROFILES.
  ## CREATED CONDITIONS FOR USERS AND TYPES FOR SIGN UP.
  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
        if @user.update_attributes(user_params)
          if @user.servicer == true && @user.phonenumber == nil
            render :edit
          else
            redirect_to user_path
          end
        else
            render :edit
        end
    else
        redirect_to root_path
    end
  end

  ## DELETES USER ACCOUNT. PREVENTS PEOPLE FROM DELETING OTHERS' PROFILES. 
  def destroy
    @user = User.find(params[:id]) 
      if @user.id == current_user.id
        @user.destroy
      end
    redirect_to users_path
  end


private
  ## Defining the paraments for the users
  def user_params
    params.require(:user).permit(:fname, :lname, :image, :servicer, :email, :provider, :phonenumber, :street_address, :city, :zipcode, :state, :bio, :password, :password_confirmation)
  end
end