class FavoritesController < ApplicationController
	before_action :require_user_logged_in
	
  def create
  	winepost = Winepost.find(params[:winepost_id])
    current_user.like(winepost)
    flash[:success] = '投稿をお気に入りに追加しました'
    redirect_to root_path
  end

  def destroy
  	winepost = Winepost.find(params[:winepost_id])
    current_user.unlike(winepost)
    flash[:success] = '投稿をお気に入りから削除しました。'
    redirect_to root_path
  end
end
