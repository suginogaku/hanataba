class TweetsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
end
