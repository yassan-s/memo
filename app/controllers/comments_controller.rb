class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.tweet_id = params[:tweet_id]

    comment.save
    redirect_to request.referer

  end


  # カプセル化
  private


  ##### paramsメソッド #####
  def comment_params
    params.require(:comment).permit(:content)
  end

end
