class UsersController < ApplicationController
  def show
    # クリックしたユーザーのマイページに遷移できるように実装した
    # クリックしたユーザーのuser情報を取得
    @user = User.find(params[:id])
    # クリックしたユーザーのtweet情報を取得
    @tweets = @user.tweets
  end
end
