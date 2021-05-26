class Tweet < ApplicationRecord

  belongs_to :user

  has_many :favorites


  # いいねしているか判定する
  # @tweet.favorited_by?(current_user)
  # tweetのいいねに対して、
  # ログインユーザーのidの有無を調べる
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
