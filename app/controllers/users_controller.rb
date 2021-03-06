class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		# if @user.save
		# 	session[:user_id] = @user.id
		# 	redirect_to '/'
		# else
		# 	redirect_back(fallback_location: 'root')
		# end
		if !verify_recaptcha(model: @user) || !@user.save
      		render "new"
      	else
      		redirect_to '/'
    	end
	end



	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
