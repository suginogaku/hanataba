class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to tweet_path(comment.tweet.id)  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
