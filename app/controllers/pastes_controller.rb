class PastesController < ApplicationController

	before_action :check_update_rights, only: [:update, :destroy]
	def index
		# if params[:search]
		# 	@pastes = Paste.where('content LIKE ? or title LIKE ?', "%#{params[:search]}%","%#{params[:search]}%").page(params[:page]).per(10).all
		# else
		# 	@pastes = Paste.order("created_at DESC").page(params[:page]).per(10).all
		# end
		@pastes = Paste.search(params).page(params[:page]).per(10).all
	end

	def new
	end

	def show
		@paste = Paste.find(params[:id])
	end

	def create
		@paste = Paste.new(paste_params)
		# If user signed in, save the user id into the paste
		if logged_in?
			@paste.user = current_user
		end

		if @paste.save
			redirect_to pastes_path
		else
			redirect_back(fallback_location: 'root')
		end

	end

	def destroy
		@paste = Paste.find(params[:id])
		@paste.destroy
		respond_to do |format|
			format.js
		end
	end


	private
	#whitelist params
	def paste_params
		params.require(:paste).permit(:title, :content)
	end

	def check_update_rights
		@paste = Paste.find(params[:id])
		if current_user.id != @paste.user_id && !current_user.admin?
			flash[:denied] = "Access denied!"
			redirect_to pastes_path
		end
	end

	def search_params
		params.require(:search).permit(:search)
	end

end
