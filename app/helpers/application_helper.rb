module ApplicationHelper
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def sign_in(user)
		session[:user_id] = user.id
	end

	def sign_out
		session[:current_user_id] = nil
	end
end
