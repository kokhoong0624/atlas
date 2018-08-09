class HomepageController < ApplicationController
  def index
  	@pastes = Paste.order("created_at DESC").page(params[:page]).per(10).all
  end
end
