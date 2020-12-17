class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :tweet_find, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
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

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
    redirect_to root_path unless current_user.id == @tweet.user_id
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit
    end
  end
  
  def destroy
    @tweet.destroy if current_user.id == @tweet.user_id
    redirect_to root_path
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :image, :description, :recommended, :flower_name, :prefecture_id, :city, :shop_name).merge(user_id: current_user.id)
  end

  def tweet_find
    @tweet = Tweet.find(params[:id])
  end
end
