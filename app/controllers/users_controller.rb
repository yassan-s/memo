class UsersController < ApplicationController

  # ログインユーザーのみ実行可能
  before_action :authenticate_user!


  ##### 詳細 #####
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    # binding.pry
  end


  ##### 一覧 #####
  def index
    @users = User.all
  end


end


##### メモ #####

# メソッドの内容が空の場合
# .html.erbビューをレンダリングする

# paramsメソッド
# ルーティングから「action,controller」をハッシュに取得
# リンクからパラメーターを取得
