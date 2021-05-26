class FavoritesController < ApplicationController

  def create
    # build:アソシエーション＋new
    # favorite.user_id = current_user.id がされている
    favorite = current_user.favorites.build(tweet_id: params[:tweet_id])
    favorite.save
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path
  end

end
