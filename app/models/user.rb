class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # ツイート
  has_many :tweets, dependent: :destroy


  # コメント
  has_many :comments, dependent: :destroy


  # いいね
  has_many :favorites, dependent: :destroy


  # has_many :Relationships → フォローする側
  # has_many :Relationships → フォローされる側
  # 同じUserモデルに二つ同じ物を書けないので、別名で分ける
  # ↓

  # ====================自分がフォローするユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。
  # なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  # has_many :followings, through: :active_relationships, source: :followed
  # ===============================================================================


  # ====================自分をフォローしているユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。
  # なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  # has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================


  def following_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)が、
    # フォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end


end
