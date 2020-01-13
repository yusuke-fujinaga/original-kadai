class ToppagesController < ApplicationController
	def index
		
		wine_type = params[:wine_type]

		if logged_in?
			if wine_type == nil 
				@wineposts = current_user.feed_wineposts.order(id: :desc).page(params[:page]).per(9)
				@text = 'Wineposts'
			elsif wine_type == '赤ワイン'
				@wineposts = current_user.feed_wineposts.order(id: :desc).where(wine_type: '赤ワイン').page(params[:page]).per(9)
				@text = 'Red wine posts'
			elsif wine_type == '白ワイン'
				@wineposts = current_user.feed_wineposts.order(id: :desc).where(wine_type: '白ワイン').page(params[:page]).per(9)
				@text = 'White wine posts'
			elsif wine_type == 'オレンジワイン'
				@wineposts = current_user.feed_wineposts.order(id: :desc).where(wine_type: 'オレンジワイン').page(params[:page]).per(9)	
				@text = 'Orange wine posts'
			elsif wine_type == 'ロゼワイン'
				@wineposts = current_user.feed_wineposts.order(id: :desc).where(wine_type: 'ロゼワイン').page(params[:page]).per(9)		
				@text = 'Rose wine posts'
			end
			
		else 
			
			if wine_type == nil 
			 @wineposts = Winepost.all.page(params[:page]).per(9)
			 @text = 'Wineposts'
			elsif wine_type == '赤ワイン'
			 @wineposts = Winepost.where(wine_type: '赤ワイン').page(params[:page]).per(9)
			 @text = 'Red wine posts'
			elsif wine_type == '白ワイン'
			 @wineposts = Winepost.where(wine_type: '白ワイン').page(params[:page]).per(9)
			 @text = 'White wine posts'
			elsif wine_type == 'オレンジワイン'
			 @wineposts = Winepost.where(wine_type: 'オレンジワイン').page(params[:page]).per(9) 
			 @text = 'Orange wine posts'
			elsif wine_type == 'ロゼワイン'
			 @wineposts = Winepost.where(wine_type: 'ロゼワイン').page(params[:page]).per(9) 
			 @text = 'Rose wine posts'
			end
		end	
	end
end
