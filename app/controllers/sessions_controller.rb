class SessionsController < ApplicationController
	def create
		user = User.find_by(username:params[:username])
	# If the user exists and the password entered is correct
		if user && user.authenticate(params[:password])
			#Save the user id inside the browser cookie.
			session[:user_id]  = user.id
			redirect_to '/'
		else
			#Redirect back to login form
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end
