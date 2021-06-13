class CommentsController < ApplicationController

    # ログインユーザーのみ実行可能
    before_action :authenticate_user!


  def create
    # 登録内容の各レコードを代入
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.tweet_id = params[:tweet_id]
    # コメントを保存
    comment.save
    # 同じ画面にリダイレクト
    redirect_to request.referer
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:format], tweet_id: params[:tweet_id])
    comment.destroy
    redirect_to request.referer
  end


  # カプセル化
  private


  ##### paramsメソッド #####
  def comment_params
    params.require(:comment).permit(:content)
  end


end
