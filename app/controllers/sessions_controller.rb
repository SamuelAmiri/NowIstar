class SessionsController < ApplicationController
	## CREATES A SESSION AND SESSION USER ID IS EQUAL TO THE AUTHENTICATED USER'S ID.
	def create
		@user = User.find_by(username: params[:session][:username])
			if @user && @user.authenticate(params[:session][:password])
				session[:user_id] = @user.id.to_s
				redirect_to root_path

			else 
				render :new
			end
	end

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end
end
