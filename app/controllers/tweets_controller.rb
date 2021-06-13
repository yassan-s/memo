class TweetsController < ApplicationController

  # ログインユーザーのみ実行可能
  before_action :authenticate_user!


  ##### 投稿フォーム #####
  def new
    # 空インスタンス生成
    @tweet = Tweet.new
  end


  ##### 投稿 #####
  def create
    # formの値を取得
    tweet = Tweet.new(tweet_params)
    # ログインユーザーの「id」を「user_id」に代入
    tweet.user_id = current_user.id
    # DBに保存
    if tweet.save
      flash[:success] = "つぶやきました！"
    else
      flash[:error] = "失敗しました。"
    end
    # top画面にリダイレクト
    redirect_to root_path
  end


  ##### 一覧 #####
  def index
    @tweets = Tweet.all.sort.reverse
  end


  ##### 詳細 #####
  def show
    @tweet = Tweet.find(params[:id])
    @new_comment = Comment.new
    @comment_list = @tweet.comments
  end


  ##### 編集 #####
  def edit
    @tweet = Tweet.find(params[:id])
  end


  ##### 更新 #####
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      flash[:success] = "更新が完了しました！"
    else
      flash[:error] = "更新できませんでした"
    end
    redirect_to tweet_path(@tweet.id)
  end


  ##### 削除 #####
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end


  # カプセル化
  private


  ##### paramsメソッド #####
  def tweet_params
    # 構文：params.require(:モデル名).permit(:キー名1, :キー名2)
    params.require(:tweet).permit(:title, :body)
  end


end


##### メモ #####

# Parameter
# フォームなどでリクエスト時に送られたデータのこと
# →ハッシュで送られ、paramsメソッドで取り出す
# params[:id(←キー名)]

# 「::」演算子
# あるクラスまたはモジュールで定義された定数を外部から参照する

# find
# find 主キーに対するレコードを取得
# find_by 条件にマッチする最初のレコードを取得
# →条件を複数選択可
# where 条件にマッチする全てのレコードを取得

# サンプル
# Tweet.find_by(id: 2, title: "ruby")

# 主キー：重複指定ない（一意の）カラム
# 複合キー：複数カラムを組み合わせた主キー
