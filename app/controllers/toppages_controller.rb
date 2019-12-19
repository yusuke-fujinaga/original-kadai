class ToppagesController < ApplicationController
  def index
  	if logged_in?
  		@wineposts = current_user.feed_wineposts.order(id: :desc).page(params[:page]).per(9)
  	else
  		@wineposts = Winepost.all.page(params[:page]).per(9)
  	end	
  end
end
