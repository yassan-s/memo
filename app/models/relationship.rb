class Relationship < ApplicationRecord

  # followingモデル フォローする側
  # Userモデルを親として、followingモデルとして変更する
  belongs_to :following, class_name: "User"

  # followed モデル フォローされる側
  # Userモデルを親として、followedモデルとして変更する
  belongs_to :followed, class_name: "User"

end
