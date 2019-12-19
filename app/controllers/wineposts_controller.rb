class WinepostsController < ApplicationController
	before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
	
  def show
  	@winepost = Winepost.find(params[:id])
  end

  def new
  	@winepost = current_user.wineposts.build
  end

  def create
  	@winepost = current_user.wineposts.build(winepost_params)
  	
  	if @winepost.save
  		flash[:success] = 'Winepost が正常に投稿されました'
      redirect_to @winepost
    else  
    	@winepost = current_user.feed_wineposts.build(winepost_params)
    	flash.now[:danger] = 'Winepost が投稿されませんでした'
      render :new
    end
  end

  def edit
  	@winepost = Winepost.find(params[:id])
  end

  def update
  	@winepost = Winepost.find(params[:id])

    if @winepost.update(winepost_params)
      flash[:success] = 'Winepost は正常に更新されました'
      redirect_to @winepost
    else
      flash.now[:danger] = 'Winepost は更新されませんでした'
      render :edit
    end  
  end

  def destroy
  	 @winepost = Winepost.find(params[:id])
    @winepost.destroy

    flash[:success] = 'Winepost は正常に削除されました'
    redirect_to root_url
  end
  
  private

  def winepost_params
    params.require(:winepost).permit(:wine_type, :grape_varieties, :country, :review, :image)
  end
  
end
