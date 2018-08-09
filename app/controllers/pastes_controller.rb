class PastesController < ApplicationController
	def index
		@pastes = Paste.order("created_at DESC").page(params[:page]).per(10).all
	end

	def new
	end

	def create
		@paste = Paste.new(paste_params)
		# If user signed in, save the user id into the paste
		if logged_in?
			@paste.user = current_user
		end

		if @paste.save
			redirect_to root_path
		else
			redirect_back(fallback_location: 'root')
		end

	end

	def destroy
	end


	private
	#whitelist params
	def paste_params
		params.require(:paste).permit(:title, :content)
	end

end
