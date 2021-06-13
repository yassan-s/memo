class FavoritesController < ApplicationController

  # ログインユーザーのみ実行可能
  before_action :authenticate_user!


  def create
    # build:アソシエーション＋new
    # favorite.user_id = current_user.id がされている
    favorite = current_user.favorites.build(tweet_id: params[:tweet_id])
    favorite.save
    # 同じページにリダイレクトする
    redirect_to request.referer
  end


  def destroy
    favorite = Favorite.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end


end
