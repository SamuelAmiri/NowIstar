class SessionsController < ApplicationController
	def new

  	end

	def show
	    redirect_to root_path unless session[:user_id]
	    @auth = current_user
	end

	def create
	   begin
	    @user = User.from_omniauth(request.env['omniauth.auth'])
	    session[:user_id] = @user.id
	   	flash[:success] = "Welcome, #{@user.fname}!"
	   rescue
	    flash[:warning] = "There was an error while trying to authenticate you..."
	   end
	  	if current_user.zipcode != nil
	  		redirect_to user_path(@user)
	  	else
	  		redirect_to new_user_path
	  	end
	end

	def destroy
	  if current_user
	    session.delete(:user_id)
	    flash[:success] = 'See you!'
	  end
	  redirect_to root_path
	end

	def auth_failure
	  redirect_to root_path
	end
end
