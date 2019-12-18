class ToppagesController < ApplicationController
  def index
  	if logged_in?
  		@wineposts = current_user.feed_wineposts.order(id: :desc).page(params[:page])
  	end	
  end
end
