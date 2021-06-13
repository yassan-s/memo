class Tweet < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  ###### いいねしているか判定する #####
  # @tweet.favorited_by?(current_user)
  # tweetのいいねに対して、ログインユーザーのidの有無を調べる
  # tweetモデルを引用したインスタンス変数で利用可能
  # → @tweets = Tweet.メソッド名
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


end
