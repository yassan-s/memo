class HomeController < ApplicationController

    # ログインユーザーのみ実行可能
    before_action :authenticate_user!


    def top
      @tweets = current_user.tweets.sort.reverse
    end


end
