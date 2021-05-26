class HomeController < ApplicationController

  # ログインユーザーのみ実行可能
  before_action :authenticate_user!

  def top
    @tweets = Tweet.all
  end
end


##### メモ #####

# メソッドの内容が空の場合
# .html.erbビューをレンダリングする
