class TweetsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :image, :description, :recommended, :flower_name, :prefecture_id, :city, :shop_name).merge(user_id: current_user.id)
  end
end
