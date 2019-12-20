class ToppagesController < ApplicationController
	def index
		
		wine_type = params[:wine_type]

		if logged_in?
			if wine_type == nil 
				@wineposts = current_user.feed_wineposts.order(id: :desc).page(params[:page]).per(9)
			elsif wine_type == '赤ワイン'
				@wineposts = current_user.feed_wineposts.order(id: :desc).where(wine_type: '赤ワイン').page(params[:page]).per(9)
			elsif wine_type == '白ワイン'
				@wineposts = current_user.feed_wineposts.order(id: :desc).where(wine_type: '白ワイン').page(params[:page]).per(9)
			end
			
		else 
			
			if wine_type == nil 
			 @wineposts = Winepost.all.page(params[:page]).per(9)
			elsif wine_type == '赤ワイン'
			 @wineposts = Winepost.where(wine_type: '赤ワイン').page(params[:page]).per(9)
			elsif wine_type == '白ワイン'
			 @wineposts = Winepost.where(wine_type: '白ワイン').page(params[:page]).per(9)
			end
		end	
	end
end
